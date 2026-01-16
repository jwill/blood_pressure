import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/csv_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CsvService Tests', () {
    final csvService = CsvService();

    test('should export records correctly with header', () {
      final record = BPRecord(
        date: DateTime(2023, 1, 1, 12, 30),
        systolic: 120,
        diastolic: 80,
        notes: 'Test note',
      );

      final csv = csvService.exportToCsv([record]);
      
      // Check header and data
      expect(csv, contains('Date,Systolic,Diastolic,Notes'));
      expect(csv, contains('2023-01-01T12:30:00.000,120,80,Test note'));
    });

    test('should import records correctly from CSV with header', () {
      final date = DateTime(2023, 1, 1, 12, 30);
      final csv = 'Date,Systolic,Diastolic,Notes\n${date.toIso8601String()},120,80,Test note';
      final records = csvService.importFromCsv(csv);

      expect(records.length, 1);
      expect(records[0].systolic, 120);
      expect(records[0].diastolic, 80);
      expect(records[0].notes, 'Test note');
      expect(records[0].date.millisecondsSinceEpoch, date.millisecondsSinceEpoch);
    });

    test('should import correctly without header', () {
      final date = DateTime(2023, 1, 1, 12, 30);
      final csv = '${date.toIso8601String()},120,80,Test note';
      final records = csvService.importFromCsv(csv);

      expect(records.length, 1);
      expect(records[0].systolic, 120);
    });

    test('round-trip should result in identical data', () {
      final originalRecords = [
        BPRecord(date: DateTime(2023, 1, 1, 10, 0), systolic: 120, diastolic: 80, notes: 'Morning'),
        BPRecord(date: DateTime(2023, 1, 1, 20, 0), systolic: 130, diastolic: 85, notes: 'Evening'),
      ];

      final csv = csvService.exportToCsv(originalRecords);
      final importedRecords = csvService.importFromCsv(csv);

      expect(importedRecords.length, originalRecords.length);
      for (int i = 0; i < originalRecords.length; i++) {
        expect(importedRecords[i].systolic, originalRecords[i].systolic);
        expect(importedRecords[i].diastolic, originalRecords[i].diastolic);
        expect(importedRecords[i].notes, originalRecords[i].notes);
        expect(importedRecords[i].date.millisecondsSinceEpoch, originalRecords[i].date.millisecondsSinceEpoch);
      }
    });

    test('should handle legacy 5-column format (Date, Time, Sys, Dia, Notes)', () {
      final csv = '2025-07-02,16:40,120,71,Missed dose by accident';
      final records = csvService.importFromCsv(csv);

      expect(records.length, 1);
      expect(records[0].date, DateTime(2025, 7, 2, 16, 40));
      expect(records[0].systolic, 120);
      expect(records[0].diastolic, 71);
      expect(records[0].notes, 'Missed dose by accident');
    });

    test('should handle invalid rows gracefully', () {
      final date = DateTime(2023, 1, 1, 13, 0);
      final csv = 'Date,Systolic,Diastolic,Notes\n'
                  'invalid-date,120,80,bad-row\n'
                  '${date.toIso8601String()},not-a-number,80,bad-systolic\n'
                  '${date.toIso8601String()},120,80,good-row';
                  
      final records = csvService.importFromCsv(csv);
      
      expect(records.length, 1);
      expect(records[0].notes, 'good-row');
    });
  });
}
