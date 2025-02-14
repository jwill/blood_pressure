import 'dart:convert';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final records = BPRecordSignal([], 'records');

  await records.init();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService(), records);

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController, signal: records,));
}
