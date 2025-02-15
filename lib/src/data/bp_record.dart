import 'dart:convert';
import 'dart:math';

class BPRecord {
  BPRecord(
      {required this.date,
      required this.systolic,
      required this.diastolic,
      this.notes = ""});

  //factory BPRecord.fromJson(Map<String, dynamic> json) => BPRecord(
  //  date: json['date'], systolic: json['systolic'], diastolic: json['diastolic']);

  final DateTime date;
  final int systolic;
  final int diastolic;
  final String notes;

  List toList() => [date, systolic, diastolic];

  Map<String, dynamic> toJson() => {
        "date": date.millisecondsSinceEpoch,
        "systolic": systolic,
        "diastolic": diastolic,
        "notes": notes
      };

  factory BPRecord.fromJson(String json) {
    var record = jsonDecode(json);
    return BPRecord(
        date: DateTime.parse(record['date']),
        systolic: int.parse(record['systolic']),
        diastolic: record['diastolic'],
        notes: record['notes']);
  }

  factory BPRecord.fromMap(Map map) {
    return BPRecord(
        date: DateTime.fromMillisecondsSinceEpoch(map['date']),
        systolic: map['systolic'],
        diastolic: map['diastolic'],
        notes: map['notes']);
  }

  @override
  String toString() {
    return '$date - $systolic / $diastolic - $notes';
  }

  static List<BPRecord> generateSampleData(int num) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    Random random = Random();
    for (int i = 0; i < num; i++) {
      list.add(BPRecord(
          date: startDate.add(Duration(days: i)),
          systolic: 110 + random.nextInt(40),
          diastolic: 60 + random.nextInt(40)));
    }
    return list;
  }

  static List<BPRecord> generateBaseline(int num, BPRecord record) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    Random random = Random();
    for (int i = 0; i < num; i++) {
      list.add(BPRecord(
          date: startDate.add(Duration(days: i)),
          systolic: record.systolic,
          diastolic: record.diastolic));
    }
    return list;
  }
}
