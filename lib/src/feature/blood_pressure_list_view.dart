import 'dart:io';

import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/records/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/records/metadata/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/response/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/units/_package.dart';
import 'package:blood_pressure_app/health_connect/java/time/_package.dart';
import 'package:blood_pressure_app/jni_utils.dart';
import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_input.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:jni/_internal.dart';
import 'package:jni/jni.dart';
import 'package:logging/logging.dart';
import 'package:signals/signals_flutter.dart';

/// Displays a list of SampleItems.
class BloodPressureListView extends StatelessWidget {
  BloodPressureListView({
    super.key,
  });

  static const routeName = '/list';
  late var hostContext;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      hostContext = JObject.fromReference(Jni.getCachedApplicationContext());
    }

    return Scaffold(
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {_dialogBuilder(context)},
          child: const Icon(Icons.add)),
    );
  }

  void insertBloodPressure(HealthConnectClient client, BPRecord record) {
    var millis = record.date.millisecondsSinceEpoch;

    var systolic = Pressure.millimetersOfMercury(record.systolic.toDouble());
    var diastolic = Pressure.millimetersOfMercury(record.diastolic.toDouble());

    var metadata = Metadata.manualEntry$2();
    var bp = BloodPressureRecord(
      Instant.ofEpochMilli(millis)!,
      getZoneOffset(),
      metadata,
      systolic,
      diastolic,
      BloodPressureRecord.BODY_POSITION_SITTING_DOWN,
      BloodPressureRecord.MEASUREMENT_LOCATION_LEFT_UPPER_ARM,
    );

    client
        .insertRecords([bp].toJList(BloodPressureRecord.type))
        .then((InsertRecordsResponse onValue) {
      print(onValue.getRecordIdsList());
    });
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final signal = SignalProvider.of<BPRecordSignal>(context);
    var input = BloodPressureInput();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add New Reading'),
            content: SingleChildScrollView(
              child: Column(
                children: [input],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  var record = BPRecord(
                      date: input.date.value,
                      systolic: int.parse(input.systolic.value),
                      diastolic: int.parse(input.diastolic.value),
                      notes: input.notes.value);

                  // Use health connect if on Android
                  if (Platform.isAndroid) {
                    var client = HealthConnectClient.getOrCreate(
                        hostContext, JString.fromString(""));
                    insertBloodPressure(client, record);
                  }

                  signal?.value.add(record);
                  // Sort before saving
                  signal?.value.sort((a, b) {
                    return a.date.millisecondsSinceEpoch
                        .compareTo(b.date.millisecondsSinceEpoch);
                  });
                  signal?.save(signal.value);

                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  Color pickColorForBP(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Colors.green;
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Colors.yellow;
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  Widget _buildList(BuildContext context) {
    final signal = SignalProvider.of<BPRecordSignal>(context)!;

    final textTheme = Theme.of(context).textTheme;
    return Watch((context) => ListView.builder(
          restorationId: 'bloodPressureItemListView',
          itemCount: signal.value.length,
          itemBuilder: (BuildContext context, int index) {
            final item = signal.value[index];
            final data = item.notes.isNotEmpty
                ? "${item.systolic}/${item.diastolic} - ${item.notes}"
                : "${item.systolic}/${item.diastolic}";

            return GestureDetector(
                onTap: () {
                  Navigator.restorablePushNamed(
                      context, BloodPressureItemDetailsView.routeName,
                      arguments: <String, String>{
                        'date': item.date.toString(),
                        'systolic': item.systolic.toString(),
                        'diastolic': item.diastolic.toString(),
                        'notes': item.notes,
                      });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: pickColorForBP(item),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          DateFormat('dd MMM').format(item.date),
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          DateFormat('HH:mm').format(item.date),
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(
                          width: 36,
                        ),
                        Text(data, style: textTheme.displaySmall)
                      ],
                    )));
          },
        ));
  }
}
