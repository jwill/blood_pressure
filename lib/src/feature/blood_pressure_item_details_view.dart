import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class BloodPressureItemDetailsView extends StatelessWidget {
  const BloodPressureItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //final box = GetStorage();
    final record = ModalRoute.of(context)?.settings.arguments as Map;
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
                    //box.remove(record['id']);
                    //.box<BPRecord>().remove(int.parse(record['id']));
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
