

import 'dart:ffi';

import 'package:blood_pressure_app/health_connect/java/time/_package.dart';
import 'package:jni/jni.dart';


class JInstantExt {
  static var clazz = JClass.forName('java/time/Instant');
  late JObject jObject;
  late JLong epochSecond;

  static final JStaticMethodId _now = clazz.staticMethodId(r'now', r'()Ljava/time/Instant;');
  static final JInstanceMethodId _epochMilli = clazz.instanceMethodId(r'toEpochMilli', r'()J');

  static JObject now() {
    var instant = _now.call(clazz, JObject.type, []);
    return instant;
  }

  // Not working
  static getEpochMilli(JObject instant) {
    return _epochMilli(instant, JLong.type, []);
  }

  static ofEpochMilli(JLong milli) {
    return clazz.staticMethodId(r'ofEpochMilli', r'(J)Ljava/time/Instant;').call(clazz, JObject.type, [milli.longValue()]);
  }

  JObject toJObject() {
    return jObject;
  }
}



ZoneOffset getZoneOffset() {
  // Get current time
  DateTime d = DateTime.now();
  var dd = d.timeZoneOffset.inHours;
  return ZoneOffset.ofHours(dd)!;
}