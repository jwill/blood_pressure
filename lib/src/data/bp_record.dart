import 'dart:convert';
import 'dart:math';

import 'catalog.dart';



   List<BPRecord> generateSampleData(int num) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    Random random = Random();
    for (int i = 0; i<num; i++) {
      list.add(BPRecord(startDate.add(Duration(days: i)), 110+random.nextInt(40), 60+random.nextInt(40)));
    }
    return list;
  }

  List<BPRecord> generateBaseline(int num, BPRecord record) {
    List<BPRecord> list = [];
    final today = DateTime.now();
    var startDate = today.subtract(Duration(days: num));
    for (int i = 0; i<num; i++) {
      list.add(BPRecord(startDate.add(Duration(days: i)), record.systolic, record.diastolic));
    }
    return list;
  }