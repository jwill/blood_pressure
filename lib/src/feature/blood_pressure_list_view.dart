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
import 'package:blood_pressure_app/src/feature/blood_pressure_input_bottom_sheet.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:jni/_internal.dart';
import 'package:jni/jni.dart';
import 'package:logging/logging.dart';
import 'package:signals/signals_flutter.dart';

import 'blood_pressure_input.dart';

/// Displays a list of SampleItems.
class BloodPressureListView extends StatefulWidget {
  BloodPressureListView({
    super.key,
  });

  static const routeName = '/list';
  late var hostContext;

  @override
  State<BloodPressureListView> createState() => _BloodPressureListViewState();
}

class _BloodPressureListViewState extends State<BloodPressureListView> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      widget.hostContext = JObject.fromReference(Jni.getCachedApplicationContext());
    }

    final colorScheme = Theme.of(context).colorScheme;
    final surfaceContainerHighest = Color(0xFFf7dcdd);
    return Scaffold(
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            showModalBottomSheet<void>(context: context,
                backgroundColor: surfaceContainerHighest,
                builder: (BuildContext context) {
                  return BloodPressureInputBottomSheet();
                })
             /* _dialogBuilder(context)*/},
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


  Color pickColorForBP(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Color(0xFF008652);
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Color(0xFFF0DC17);
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  Color pickColorForBPText(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Color(0xFFF6FFF5);
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Color(0xFF696000);
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.black;
    } else {
      return Color(0xFF302202);
    }
  }

  Widget _buildItem(BuildContext context, BPRecord item) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final notoSans = GoogleFonts.notoSans();
    final neutral70 = Color(0xFFB4A9A8);
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
        child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: neutral70,),
                            SizedBox(width:4),
                            Text(DateFormat('hh:mm aaa').format(item.date), style: notoSans.copyWith(color: neutral70, fontSize: 12),)
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.event, size: 16, color: neutral70,),
                            SizedBox(width:4),
                            Text(DateFormat('dd MMM').format(item.date), style: notoSans.copyWith(color: neutral70, fontSize: 12),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 264,
                        decoration: BoxDecoration(
                            color: pickColorForBP(item),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Baseline(
                          baseline: 24,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            "${item.systolic} / ${item.diastolic}",
                            style: GoogleFonts.concertOne().copyWith(
                              color: pickColorForBPText(item),
                                fontSize: textTheme.titleLarge?.fontSize),
                          ),
                        )),
                  ],
                ))));
  }

  Widget _buildList(BuildContext context) {
    final signal = SignalProvider.of<BPRecordSignal>(context)!;

    return Watch((context) => ListView.builder(
          restorationId: 'bloodPressureItemListView',
          itemCount: signal.value.length,
          itemBuilder: (BuildContext context, int index) {
            final item = signal.value[index];
            final data = item.notes.isNotEmpty
                ? "${item.systolic}/${item.diastolic} - ${item.notes}"
                : "${item.systolic}/${item.diastolic}";

            return _buildItem(context, item);
          },
        ));
  }


}
