import 'dart:convert';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/key_value_store.dart';
import 'package:blood_pressure_app/src/data/persisted_signal.dart';

class BPRecordSignal extends PersistedSignal<List<BPRecord>> {
  BPRecordSignal(super.val, String key)
      : super(
          key: key,
          store: SharedPreferencesStore(),
        );

  @override
  String encode(List<BPRecord> list) {
    return jsonEncode(list);
  }

  @override
  List<BPRecord> decode(String value) {
    List<dynamic> list = jsonDecode(value);
    List<BPRecord> records = [];
    for (var item in list) {
      records.add(BPRecord.fromMap(item));
    }
    return records;
  }
}
