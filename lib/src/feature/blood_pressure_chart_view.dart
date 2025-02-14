import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:flutter/material.dart';

import 'package:d_chart/d_chart.dart';

/// Displays a list of SampleItems.
class BloodPressureChartView extends StatelessWidget {
  const BloodPressureChartView({
    super.key,
  });

  static const routeName = '/b';

  // Box<BPRecord> bpBox = objectBox.store.box<BPRecord>();
  // List<BPRecord> items = bpBox.getAll(); //BPRecord.generateSampleData(45);

  @override
  Widget build(BuildContext context) {
    var items = []; //box.getValues();
    print(items.toList());

    return _buildChart(context, items.toList());
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
      TimeGroup(id: '3', data: baselineSystolic),
      TimeGroup(id: '4', data: baselineDiastolic)
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
