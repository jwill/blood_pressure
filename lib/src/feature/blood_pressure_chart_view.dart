import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';
import 'package:signals/signals_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

/// Displays a list of SampleItems.
class BloodPressureChartView extends StatelessWidget {
  const BloodPressureChartView({
    super.key,
  });

  static const routeName = '/b';

  @override
  Widget build(BuildContext context) {
    final signal = SignalProvider.of<BPRecordSignal>(context)!;
    WidgetsToImageController controller = WidgetsToImageController();

    var items = signal.value; //box.getValues();
    print(items.toList());

    return Scaffold(
      body: WidgetsToImage(
          controller: controller, child: _buildChart(context, items.toList())),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var bytes = await controller.capture();
            SettingsController.saveImage(bytes!);
          },
          child: const Icon(Icons.photo)),
    );
  }

  Color pickColorForBP(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Colors.green;
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Colors.yellow;
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.red;
    } else
      return Colors.orange;
  }

  Widget _buildChart(BuildContext context, List items) {
    final colorScheme = Theme.of(context).colorScheme;
    List<TimeData> systolic = items
        .map((e) => TimeData(domain: e.date, measure: e.systolic))
        .toList();
    List<TimeData> diastolic = items
        .map((e) => TimeData(domain: e.date, measure: e.diastolic))
        .toList();

    List<TimeData> baselineDiastolic = BPRecord.generateBaseline(items.length,
            BPRecord(date: DateTime.now(), systolic: 120, diastolic: 80))
        .map((e) => TimeData(domain: e.date, measure: e.diastolic))
        .toList();
    List<TimeData> baselineSystolic = BPRecord.generateBaseline(items.length,
            BPRecord(date: DateTime.now(), systolic: 120, diastolic: 80))
        .map((e) => TimeData(domain: e.date, measure: e.systolic))
        .toList();

    final timeGroupList = [
      TimeGroup(
        id: '1',
        color: colorScheme.secondary,
        data: systolic,
      ),
      TimeGroup(
        id: '2',
        color: colorScheme.tertiary,
        data: diastolic,
      ),
      // TimeGroup(id: '3', data: baselineSystolic),
      // TimeGroup(id: '4', data: baselineDiastolic)
    ];

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DChartLineT(
          allowSliding: true,
          measureAxis: const MeasureAxis(
              numericViewport: NumericViewport(60, 155), showLine: true),
          //configRenderLine: ConfigRenderLine(includePoints: true),
          groupList: timeGroupList,
        ));
  }
}
