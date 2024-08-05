import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:flutter/material.dart';

import 'sample_item_details_view.dart';
import 'package:intl/intl.dart';


/// Displays a list of SampleItems.
class BloodPressureListView extends StatelessWidget {
   BloodPressureListView({
    super.key,  
  });

  static const routeName = '/b';

  List<BPRecord> items = BPRecord.generateSampleData(30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(onPressed: () => {}, 
      child: const Icon(Icons.add)
      ),
    );
  }

Color pickColorForBP(BPRecord record) {
  if (record.systolic <= 120 && record.diastolic <= 80) {
    return Colors.green;
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
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
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

          /*return ListTile(
            title: Text('SampleItem ${item.toJson()}'),
            leading: Container(height: 24, width: 24,
              decoration: BoxDecoration(
                color: pickColorForBP(item),
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );*/
        },
      );
}
}
/* 
ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text('SampleItem ${item.id}'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );
        },
      ),
      */