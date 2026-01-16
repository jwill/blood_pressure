import 'dart:async';
import 'package:jni/jni.dart' as jni;
import '../../health_connect/androidx/health/connect/client/HealthConnectClient.dart';
import '../../health_connect/androidx/health/connect/client/PermissionController.dart';
import '../../health_connect/androidx/health/connect/client/permission/HealthPermission.dart';
import '../../health_connect/androidx/activity/ComponentActivity.dart';
import '../../health_connect/androidx/activity/result/ActivityResultCallback.dart';
import '../../health_connect/androidx/activity/result/ActivityResultLauncher.dart';
import 'package:signals/signals.dart';

import 'package:flutter/services.dart';

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
}
