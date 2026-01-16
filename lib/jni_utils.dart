// ignore_for_file: invalid_use_of_internal_member
import 'package:jni/jni.dart' as jni;
import 'package:jni/_internal.dart' as jni;
import 'health_connect/java/time/_package.dart';
import 'health_connect/kotlin/jvm/JvmClassMappingKt.dart' as jvm;

jni.JObject getKotlinClass(jni.JClass jClass, {required jni.JObjType T}) {
  return jvm.getKotlinClass(jClass.as(const jni.JObjectType()), T: T);
}

ZoneOffset getZoneOffset() {
  // Get current time
  DateTime d = DateTime.now();
  var dd = d.timeZoneOffset.inHours;
  return ZoneOffset.ofHours(dd)!;
}

extension TimeUtils on DateTime {
  Instant toInstant() {
    return Instant.ofEpochMilli(millisecondsSinceEpoch)!;
  }
}
