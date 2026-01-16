import 'dart:convert';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/key_value_store.dart';
import 'package:signals/signals_flutter.dart';

class BPRecordSignal extends FlutterSignal<List<BPRecord>> with PersistedSignalMixin<List<BPRecord>> {
  BPRecordSignal(super.val, this.key) : _store = SharedPreferencesStore();

  @override
  final String key;

  final SignalsKeyValueStore _store;

  @override
  SignalsKeyValueStore get store => _store;

  @override
  String encode(List<BPRecord> value) {
    return jsonEncode(value);
  }

  @override
  List<BPRecord> decode(String value) {
    List<dynamic> list = jsonDecode(value);
    List<BPRecord> records = [];
    for (var item in list) {
      records.add(BPRecord.fromMap(item));
    }
    records.sort((a, b) {
      return a.date.millisecondsSinceEpoch
          .compareTo(b.date.millisecondsSinceEpoch);
    });
    return records;
  }
}
