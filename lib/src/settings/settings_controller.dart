import 'dart:typed_data';

import 'package:blood_pressure_app/main.dart';
import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'settings_service.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:csv/csv.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

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

      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(csvString, eol: '\n');

      print(rowsAsListOfValues.length);

List<BPRecord> records = [];

      for (var i = 1; i < rowsAsListOfValues.length; i++) {
          var row = rowsAsListOfValues[i];
          print(row);
          DateTime fullDate = DateFormat.yMd().parse(row[0]);
          // Fix for wacky parser
          fullDate = DateTime(fullDate.year + 2000, fullDate.month, fullDate.day);
          final t = DateFormat.Hm().parse(row[1]);
          fullDate = fullDate.add(Duration( hours: t.hour, minutes: t.minute));

          records.add(BPRecord(date:fullDate, systolic: row[2], diastolic: row[3]));
      }

      print(file.name);
      //final bytes = await file.readAsBytes();
      /*var excel = Excel.decodeBytes(bytes);
      Sheet sheet = excel[excel.getDefaultSheet()!];
      List<BPRecord> records = [];

      for (var i = 0; i < sheet.rows.length; i++) {
        if (i != 0) {
          var row = sheet.rows[i];
          print(row);
          TextCellValue date = row[0]!.value as TextCellValue;
          TextCellValue time = row[1]!.value as TextCellValue;
          TextCellValue sys = row[2]!.value as TextCellValue;
          TextCellValue dia = row[3]!.value as TextCellValue;


        DateTime fullDate = DateFormat.yMd().parse(date.value);
        final t = DateFormat.Hm().parse(time.value);
        fullDate = fullDate.add(Duration(hours: t.hour, minutes: t.minute));

          records.add(BPRecord(date:fullDate, systolic: sys.value, diastolic: dia.value));
        }
      }*/
      print(records);
      objectBox.box<BPRecord>().removeAll();
      print(objectBox.box<BPRecord>().putMany(records));
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }

  Future<void> saveFile() async {
    var excel = Excel.createExcel();

    var list = BPRecord.generateSampleData(25);

    var headerRow = [
      TextCellValue("Date"),
      TextCellValue("Time"),
      TextCellValue("Systolic"),
      TextCellValue("Diastolic")
    ];
    excel.appendRow("Sheet1", headerRow);
    for (var element in list) {
      var row = [
        TextCellValue(DateFormat.yMd().format(element.date)),
        TextCellValue(DateFormat.Hm().format(element.date)),
        
        IntCellValue(element.systolic),
        IntCellValue(element.diastolic)
      ];

      print(DateTimeCellValue(
            year: element.date.year,
            month: element.date.month,
            day: element.date.day,
            hour: element.date.hour,
            minute: element.date.minute));
      excel.appendRow("Sheet1", row);
    }

    print(excel.sheets);

    String? result = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: 'output.xlsx',
        bytes: excel.save() as Uint8List);
  }
}
