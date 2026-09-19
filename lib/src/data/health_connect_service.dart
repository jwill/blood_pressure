import 'dart:async';
import 'package:jni/jni.dart' as jni;
import '../../health_connect/androidx/health/connect/client/HealthConnectClient.dart';
import '../../health_connect/androidx/health/connect/client/PermissionController.dart';
import '../../health_connect/androidx/health/connect/client/permission/HealthPermission.dart';
import '../../health_connect/androidx/health/connect/client/records/BloodPressureRecord.dart';
import '../../health_connect/androidx/health/connect/client/records/metadata/Metadata.dart';
import '../../health_connect/androidx/health/connect/client/units/Pressure.dart';
import '../../health_connect/androidx/health/connect/client/records/metadata/DataOrigin.dart';
import '../../health_connect/androidx/health/connect/client/request/ReadRecordsRequest.dart';
import '../../health_connect/androidx/health/connect/client/response/ReadRecordsResponse.dart';
import '../../health_connect/androidx/health/connect/client/time/TimeRangeFilter.dart';
import '../../health_connect/java/time/Instant.dart';
import '../../jni_utils.dart';
import 'package:signals/signals.dart';
import 'package:flutter/services.dart';
import 'bp_record.dart';

class HealthConnectService {
  static const _channel = MethodChannel('androidx.healthconnect');
  final isConnected = signal(false);

  void init() {
    _updateConnectionStatus();
  }

  Future<void> _updateConnectionStatus() async {
    try {
      var activityPtr = jni.Jni.getCurrentActivity();
      if (activityPtr.isNull) {
        activityPtr = jni.Jni.getCachedApplicationContext();
      }
      if (activityPtr.isNull) {
        print("HealthConnectService: No context available, cannot update status");
        return;
      }
      final client = HealthConnectClient.Companion.getOrCreate$1(
        jni.JObject.fromReference(activityPtr),
      );
      final pc = client.getPermissionController();
      
      final granted = await pc.getGrantedPermissions();
      
      final readPerm = HealthPermission.READ_BLOOD_PRESSURE;
      final writePerm = HealthPermission.WRITE_BLOOD_PRESSURE;
      
      isConnected.value = granted.contains(readPerm) && granted.contains(writePerm);
      
      readPerm.release();
      writePerm.release();
      granted.release();
      pc.release();
      client.release();
    } catch (e) {
      print("Error updating Health Connect connection status: $e");
      isConnected.value = false;
    }
  }

  Future<void> checkPermissions() => _updateConnectionStatus();

  Future<void> insertBloodPressure(BPRecord record) async {
    try {
      var activityPtr = jni.Jni.getCurrentActivity();
      if (activityPtr.isNull) {
        activityPtr = jni.Jni.getCachedApplicationContext();
      }
      if (activityPtr.isNull) {
        print("HealthConnectService: No context available for insertion");
        return;
      }
      
      final client = HealthConnectClient.Companion.getOrCreate$1(
        jni.JObject.fromReference(activityPtr),
      );

      final systolic = Pressure.millimetersOfMercury(record.systolic.toDouble());
      final diastolic = Pressure.millimetersOfMercury(record.diastolic.toDouble());
      final metadata = Metadata.manualEntry$2();

      final bp = BloodPressureRecord(
        record.date.toInstant(),
        getZoneOffset(),
        metadata,
        systolic,
        diastolic,
        BloodPressureRecord.BODY_POSITION_SITTING_DOWN,
        BloodPressureRecord.MEASUREMENT_LOCATION_LEFT_UPPER_ARM,
      );

      await client.insertRecords([bp].toJList(BloodPressureRecord.type));
      
      // Cleanup
      bp.release();
      metadata.release();
      diastolic.release();
      systolic.release();
      client.release();
    } catch (e) {
      print("Error inserting into Health Connect: $e");
    }
  }

  Future<void> batchInsertBloodPressure(List<BPRecord> records) async {
    if (records.isEmpty) return;
    
    try {
      var activityPtr = jni.Jni.getCurrentActivity();
      if (activityPtr.isNull) {
        activityPtr = jni.Jni.getCachedApplicationContext();
      }
      if (activityPtr.isNull) {
        print("HealthConnectService: No context available for batch insertion");
        return;
      }
      
      final client = HealthConnectClient.Companion.getOrCreate$1(
        jni.JObject.fromReference(activityPtr),
      );

      final zoneOffset = getZoneOffset();
      
      const chunkSize = 50;
      for (var i = 0; i < records.length; i += chunkSize) {
        final end = i + chunkSize > records.length ? records.length : i + chunkSize;
        final chunk = records.sublist(i, end);
        final List<BloodPressureRecord> nativeRecords = [];
        final List<jni.JObject> toRelease = [];

        for (final record in chunk) {
          final systolicValue = record.systolic.toDouble();
          final diastolicValue = record.diastolic.toDouble();
          
          final systolic = Pressure.millimetersOfMercury(systolicValue);
          final diastolic = Pressure.millimetersOfMercury(diastolicValue);
          final metadata = Metadata.manualEntry$2();

          final bp = BloodPressureRecord(
            record.date.toInstant(),
            zoneOffset,
            metadata,
            systolic,
            diastolic,
            BloodPressureRecord.BODY_POSITION_SITTING_DOWN,
            BloodPressureRecord.MEASUREMENT_LOCATION_LEFT_UPPER_ARM,
          );
          nativeRecords.add(bp);
          toRelease.add(bp);
          toRelease.add(metadata);
          toRelease.add(systolic);
          toRelease.add(diastolic);
        }

        final jList = nativeRecords.toJList(BloodPressureRecord.type);
        await client.insertRecords(jList);
        jList.release();
        
        for (final obj in toRelease) {
          obj.release();
        }
      }
      
      client.release();
      zoneOffset.release();
    } catch (e) {
      print("Error batch inserting into Health Connect: $e");
    }
  }

  Future<void> requestPermissions() async {
    try {
      await _channel.invokeMethod('requestPermissions');
      // Status will be updated when the user returns to the app
      // For now, we can check again after a short delay or when the app resumes.
      _updateConnectionStatus();
    } catch (e) {
      print("Error requesting Health Connect permissions: $e");
    }
  }

  Future<List<BPRecord>> readBloodPressure(DateTime start, DateTime end) async {
    try {
      var activityPtr = jni.Jni.getCurrentActivity();
      if (activityPtr.isNull) {
        activityPtr = jni.Jni.getCachedApplicationContext();
      }
      if (activityPtr.isNull) {
        print("HealthConnectService: No context available for reading");
        return [];
      }
      
      final client = HealthConnectClient.Companion.getOrCreate$1(
        jni.JObject.fromReference(activityPtr),
      );

      final kClass = getKotlinClass(BloodPressureRecord.type.jClass, T: BloodPressureRecord.type);
      final filter = TimeRangeFilter.Companion.between(start.toInstant(), end.toInstant());
      
      final request = ReadRecordsRequest(
        kClass,
        filter,
        <DataOrigin>[].toJSet(DataOrigin.type),
        false, // ascendingOrder
        100, // pageSize
        null, // pageToken
        0, // deduplicateStrategy
        T: BloodPressureRecord.type,
      );

      final response = await client.readRecords(request, T: BloodPressureRecord.type);
      final records = response.getRecords();
      
      final List<BPRecord> result = [];
      for (var i = 0; i < records.length; i++) {
        final bp = records[i];
        final record = BPRecord(
          date: DateTime.fromMillisecondsSinceEpoch(bp.getTime().toEpochMilli()),
          systolic: bp.getSystolic().getMillimetersOfMercury().round(),
          diastolic: bp.getDiastolic().getMillimetersOfMercury().round(),
          notes: "",
        );
        result.add(record);
        bp.release();
      }
      
      // Cleanup
      records.release();
      response.release();
      request.release();
      filter.release();
      kClass.release();
      client.release();
      
      return result;
    } catch (e) {
      print("Error reading from Health Connect: $e");
      return [];
    }
  }
}
