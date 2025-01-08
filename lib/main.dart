
import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/catalog.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  var config = Configuration.local([BPRecord.schema]);
  var realm = Realm(config);

  // TODO Remove me later
  var records = generateSampleData(15);
   realm.write(() {
     realm.deleteAll<BPRecord>();

     realm.addAll(records);
   });

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(realm: realm, settingsController: settingsController));
}
