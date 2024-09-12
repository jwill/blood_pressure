import 'package:blood_pressure_app/main.dart';
import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


/// Displays a list of SampleItems.
class BloodPressureListView extends StatelessWidget {
   BloodPressureListView({
    super.key,  
  });

  static const routeName = '/b';

  late List<BPRecord> items;

  @override
  Widget build(BuildContext context) {
    final box = objectBox.box<BPRecord>();
    items = box.getAll().reversed.toList();
    return Scaffold(
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(onPressed: () => {}, 
      child: const Icon(Icons.add)
      ),
    );
  }

Color pickColorForBP(BPRecord record) {
  if (record.systolic <= 120 && record.diastolic <= 80) {
    return Colors.green;
  } else if (record.systolic <=130 && record.diastolic <= 85) {
    return Colors.yellow;
  } else if (record.systolic >= 140 || record.diastolic >= 90) {
    return Colors.red;
  } else return Colors.orange;
}

Widget _buildList(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'bloodPressureItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                BloodPressureItemDetailsView.routeName,
                arguments: <String, String>{
                  'id': item.id.toString(),
                  'date': item.date.toString(),
                  'systolic': item.systolic.toString(),
                  'diastolic': item.diastolic.toString()
                }
              );
            },
            child: 
          Padding(padding:const EdgeInsets.all(8.0), child:Row(children: [
            Container(height: 36, width: 36,
              decoration: BoxDecoration(
                color: pickColorForBP(item),
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
              ),
            ),
            const SizedBox(width: 8,),
            Text( DateFormat('dd MMM').format(item.date), style: textTheme.titleLarge,),
            const SizedBox(width: 8,),
            Text( DateFormat('HH:mm').format(item.date), style: textTheme.titleLarge,),
            const SizedBox(width: 36,),
            Text("${item.systolic}/${item.diastolic}", style: textTheme.displaySmall)
          ],)));
        },
      );
}
}