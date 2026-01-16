import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/data/key_value_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BPRecordSignal Tests', () {
    test('should sort records by date when decoding', () {
      final signal = BPRecordSignal([], 'test_key');
      final record1 = BPRecord(date: DateTime(2023, 1, 2), systolic: 120, diastolic: 80);
      final record2 = BPRecord(date: DateTime(2023, 1, 1), systolic: 110, diastolic: 70);
      
      final records = [record1, record2];
      final encoded = signal.encode(records);
      final decoded = signal.decode(encoded);

      expect(decoded.length, 2);
      expect(decoded[0].date, record2.date);
      expect(decoded[1].date, record1.date);
    });

    test('should encode and decode correctly', () {
      final signal = BPRecordSignal([], 'test_key');
      final record = BPRecord(date: DateTime(2023, 1, 1, 12, 0), systolic: 120, diastolic: 80, notes: 'Feeling good');
      
      final encoded = signal.encode([record]);
      final decoded = signal.decode(encoded);

      expect(decoded.length, 1);
      expect(decoded[0].systolic, 120);
      expect(decoded[0].diastolic, 80);
      expect(decoded[0].notes, 'Feeling good');
      expect(decoded[0].date.millisecondsSinceEpoch, record.date.millisecondsSinceEpoch);
    });
  });
}
