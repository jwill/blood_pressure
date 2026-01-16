import 'package:blood_pressure_app/src/app.dart';
import 'package:blood_pressure_app/src/data/csv_service.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/settings/settings_controller.dart';
import 'package:blood_pressure_app/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signals/signals_flutter.dart';

void main() {
  testWidgets('Adding a blood pressure record updates the list', (WidgetTester tester) async {
    // Initialize things like in main.dart but for testing
    final records = BPRecordSignal([], 'test_records');
    final settingsController = SettingsController(SettingsService(), records, CsvService());
    await settingsController.loadSettings();

    await tester.pumpWidget(MyApp(
      settingsController: settingsController,
      signal: records,
    ));

    // Initially no records should be visible in the list (assuming fresh start)
    // The ListView.builder uses Watch, so it should be empty.
    expect(find.byType(Card), findsNothing);

    // Tap the FAB to add a record
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Wait for bottom sheet

    // Enter systolic and diastolic values
    // Finding by label text as it is unique and reliable
    await tester.enterText(find.widgetWithText(TextField, 'Top number (systolic)'), '130');
    await tester.enterText(find.widgetWithText(TextField, 'Bottom number (diastolic)'), '85');

    // Tap "Add"
    final addButton = find.text('Add');
    await tester.ensureVisible(addButton);
    await tester.tap(addButton);
    await tester.pumpAndSettle(); // Wait for bottom sheet to close and list to update

    // Verify a record appears in the list
    expect(find.byType(Card), findsOneWidget);
    expect(find.textContaining('130 / 85'), findsOneWidget);
  });
}
