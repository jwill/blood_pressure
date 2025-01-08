import 'package:blood_pressure_app/main.dart';
import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_input.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/intl.dart';
import 'package:realm/realm.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';

import '../data/catalog.dart';


/// Displays a list of SampleItems.
class BloodPressureListView extends StatelessWidget {
   BloodPressureListView({
    super.key,
     required this.realm
  });

  static const routeName = '/b';

  final items = listSignal([]);
  final Realm realm;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {

    //TODO Signal watch
    items.value = realm.all<BPRecord>().toList();
    return Scaffold(
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(onPressed: () => {
        _dialogBuilder(context)
      },
      child: const Icon(Icons.add)
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    var input = BloodPressureInput();
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(title: const Text('Add New Reading'),
      content: SingleChildScrollView(child: Column(children: [
        input
      ],),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              realm.write((){
                var record = BPRecord(input.date.value, int.parse(input.systolic.value), int.parse(input.diastolic.value));
                realm.add(record);
              });
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],);
    });
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
  return Watch((context) => ListView.builder(
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
      ));
}
}