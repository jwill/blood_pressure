import 'dart:io';
import 'package:realm/realm.dart';

part 'catalog.realm.dart';

@RealmModel()
class _BPRecord {
  late DateTime date;
  late int systolic;
  late int diastolic;
}