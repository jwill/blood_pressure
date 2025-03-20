import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../data/bp_record_signal.dart';

/// Displays detailed information about a SampleItem.
class BloodPressureItemDetailsView extends StatelessWidget {
  const BloodPressureItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final record = ModalRoute.of(context)?.settings.arguments as Map;
    final signal = SignalProvider.of<BPRecordSignal>(context)!;

    print(record);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [Text("Date"), Spacer(), Text(record['date'])],
            ),
            Row(
              children: [Text("Systolic"), Spacer(), Text(record['systolic'])],
            ),
            Row(
              children: [
                Text("Diastolic"),
                Spacer(),
                Text(record['diastolic'])
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  onPressed: () {}, child: const Text("Edit Item")),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.error),
                  onPressed: () {
                    signal.value.removeWhere((BPRecord elem) =>
                      elem.date == DateTime.parse(record["date"])
                    );
                    signal.save(signal.value);
                    Navigator.pop(context);
                  },
                  child: const Text("Delete Item")),
            ),
          ],
        ),
      )),
    );
  }
}
