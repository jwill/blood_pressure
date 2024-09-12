import 'dart:math';

import 'package:objectbox/objectbox.dart';

@Entity()
class BPRecord {
  BPRecord({required this.date, required this.systolic, required this.diastolic});

  //factory BPRecord.fromJson(Map<String, dynamic> json) => BPRecord(
  //  date: json['date'], systolic: json['systolic'], diastolic: json['diastolic']);

  @Id()
  int id = 0;

  @Property(type: PropertyType.date)
  final DateTime date;
  final int systolic;
  final int diastolic;

  Map<String, dynamic> toJson() => {
    'date': date,
    'systolic': systolic,
    'diastolic': diastolic
  };

  @override
  String toString() {
    return '$date - $systolic / $diastolic';
  }

  static List<BPRecord> generateSampleData(int num) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    Random random = Random();
    for (int i = 0; i<num; i++) {
      list.add(BPRecord(date: startDate.add(Duration(days: i)), systolic: 110+random.nextInt(40), diastolic: 60+random.nextInt(40)));
    }
    return list;
  }

  static List<BPRecord> generateBaseline(int num, BPRecord record) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    Random random = Random();
    for (int i = 0; i<num; i++) {
      list.add(BPRecord(date: startDate.add(Duration(days: i)), systolic: record.systolic, diastolic: record.diastolic));
    }
    return list;
  }
}