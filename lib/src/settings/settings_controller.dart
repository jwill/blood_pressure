import 'dart:typed_data';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'settings_service.dart';
import 'package:csv/csv.dart';
import 'dart:io' show File, Platform;

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService, this.recordsSignal);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  BPRecordSignal recordsSignal;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      XFile file = result.xFiles.first;
      final csvString = await file.readAsString();

      List<List<dynamic>> rowsAsListOfValues =
          const CsvToListConverter().convert(csvString, eol: '\n');

      print(rowsAsListOfValues.length);

      List<BPRecord> records = [];

      for (var i = 0; i < rowsAsListOfValues.length; i++) {
        var row = rowsAsListOfValues[i];
        print(row);
        DateTime fullDate = DateTime.parse(row[0]);
        var notes = row.length > 3 ? row[3] : "";
        records.add(BPRecord(
            date: fullDate, systolic: row[1], diastolic: row[2], notes: notes));
      }

      recordsSignal.value = records;
      recordsSignal.save(records);
      recordsSignal.notifyListeners();
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }

  Future<void> saveFile() async {
    var records = recordsSignal.value;
    List<List> list = [];
    for (var element in records) {
      list.add([
        element.date.toString(),
        element.systolic,
        element.diastolic,
        element.notes
      ]);
    }
    final res = const ListToCsvConverter().convert(list);
    String? result;
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      result = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:', fileName: 'output.csv');
      if (result != null) {
        // saveFile doesn't actually save on desktop
        var file = File(result);
        file.writeAsString(res);
      }
    } else {
      result = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:',
          fileName: 'output.csv',
          bytes: Uint8List.fromList(res.codeUnits));
    }
  }

  static Future<void> saveImage(Uint8List bytes) async {
    String? result;
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      result = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:', fileName: 'output.png');
      if (result != null) {
        // saveFile doesn't actually save on desktop
        var file = File(result);
        file.writeAsBytes(bytes);
      }
    } else {
      result = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:',
          fileName: 'output.png',
          bytes: bytes);
    }
  }

  Future<void> clearRecords() async {
    recordsSignal.clear();
    recordsSignal.save([]);
    recordsSignal.notifyListeners();
  }
}
