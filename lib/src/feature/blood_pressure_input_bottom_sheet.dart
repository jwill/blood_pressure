import 'dart:io';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jni/jni.dart';
import 'package:signals/signals_flutter.dart';

import '../../health_connect/androidx/health/connect/client/HealthConnectClient.dart';
import '../../health_connect/androidx/health/connect/client/records/BloodPressureRecord.dart';
import '../../health_connect/androidx/health/connect/client/records/metadata/Metadata.dart';
import '../../health_connect/androidx/health/connect/client/response/InsertRecordsResponse.dart';
import '../../health_connect/androidx/health/connect/client/units/Pressure.dart';
import '../../health_connect/java/time/Instant.dart';
import '../../jni_utils.dart';
import '../data/bp_record_signal.dart';

class BloodPressureInputBottomSheet extends StatefulWidget {
  final date = signal(DateTime.now());
  final systolic = signal('');
  final diastolic = signal('');
  final notes = signal('');

  BloodPressureInputBottomSheet({super.key});

  @override
  State<BloodPressureInputBottomSheet> createState() =>
      _BloodPressureInputBottomSheetState();
}

class _BloodPressureInputBottomSheetState
    extends State<BloodPressureInputBottomSheet> {
  late TextEditingController _systolic_controller;
  late TextEditingController _diatolic_controller;
  late TextEditingController _notes_controller;
  final concertOne = GoogleFonts.concertOne();
  final corben = GoogleFonts.corben();

  @override
  void initState() {
    super.initState();
    _systolic_controller =
        TextEditingController(text: widget.systolic.value.toString());
    _diatolic_controller =
        TextEditingController(text: widget.diastolic.value.toString());
    _notes_controller =
        TextEditingController(text: widget.notes.value.toString());
  }

  @override
  void dispose() {
    _systolic_controller.dispose();
    _diatolic_controller.dispose();
    _notes_controller.dispose();
    super.dispose();
  }

  static int? argbFromHex(String hex) {
    return int.tryParse(hex.replaceAll('#', ''), radix: 16);
  }

  void saveRecord() {
    final signal = SignalProvider.of<BPRecordSignal>(context);
    var hostContext;
    if (Platform.isAndroid) {
      hostContext = JObject.fromReference(Jni.getCachedApplicationContext());
    }
print(widget.systolic.value);
    var record = BPRecord(
          date: widget.date.value,
          systolic: int.parse(_systolic_controller.text),
          diastolic: int.parse(_diatolic_controller.text),
          notes: widget.notes.value);

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


@override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 24, top: 40, bottom: 0),
            child: Text(
              "New Reading",
              style: textTheme.headlineSmall
                  ?.copyWith(fontFamily: corben.fontFamily),
            )),
        Column(
          spacing: 4,
          children: [
            Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 16, bottom: 8, right: 16),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFF0F0),
                    border: InputBorder.none,
                    labelText: "Top number (systolic)",
                    labelStyle: concertOne,
                  ),
                  style: concertOne,
                  controller: _systolic_controller,
                  onChanged: (value) {
                    widget.systolic.value = value;
                  },
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 0, bottom: 16, right: 16),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFF0F0),
                    border: InputBorder.none,
                    labelText: "Bottom number (diastolic)",
                    labelStyle: concertOne,
                  ),
                  style: concertOne,
                  controller: _diatolic_controller,
                  onChanged: (value) {
                    widget.diastolic.value = value;
                  },
                )),
            // TextField(
            //   controller: _notes_controller,
            //   onChanged: (value) {
            //     widget.notes.value = value;
            //   },
            // ),
          ],
        ),
        Padding(padding: EdgeInsets.only(left:24.0, right: 24.0, top:12), child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            spacing: 8,
            children: [
              Baseline(
                baseline: 32.0,
                baselineType: TextBaseline.ideographic,
                child:Icon(Icons.event)),

          Watch((context) {
            var displayDate = widget.date.value;
            final display = DateFormat.yMd().format(displayDate);
            return Text(
              display,
              style: concertOne.copyWith(fontSize: textTheme.titleLarge?.fontSize),
            );
          }),
          ],),

          const SizedBox(
            width: 8,
          ),
          IconButton.filled(
            onPressed: () async {
              showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now())
                  .then((value) => widget.date.value = value!);
            },
            icon: Icon(Icons.edit),
          )
        ])),

        Padding(padding: EdgeInsets.only(left:24, right: 24.0, top:12),  child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(spacing: 8,
          children: [
          Baseline(
              baseline: 32.0,
              baselineType: TextBaseline.ideographic,
              child:Icon(Icons.schedule)),
          Watch((context) {
            var displayTime = widget.date.value;
            final display = DateFormat.Hm().format(displayTime);
            return Text(
              display,
              style: concertOne.copyWith(fontSize: textTheme.titleLarge?.fontSize),
            );
          })]),
          const SizedBox(
            width: 8,
          ),
          IconButton.filled(
            onPressed: () async {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                widget.date.value = widget.date.value
                    .copyWith(hour: value?.hour, minute: value?.minute);
              });
            },
            icon: Icon(Icons.edit),
          )
        ]),
          ),
        Padding(padding: EdgeInsets.only(right:24, top:64), child:Row(spacing: 16, mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(onPressed: (){Navigator.pop(context, 'Cancel');}, child: Text("Cancel")),
          FilledButton(onPressed: (){saveRecord();}, child: Text("Add"))
        ],))
      ],
    );
  }
}
