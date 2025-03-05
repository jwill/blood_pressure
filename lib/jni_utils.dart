

import 'package:jni/jni.dart';

var instantClass = JClass.forName('java/time/Instant');

JObject getInstant_now() {
  return instantClass.staticMethodId(r'now', r'()Ljava/time/Instant;').call(instantClass, JObject.type, []);
}

JObject getZoneOffset() {
  // Get current time
  DateTime d = DateTime.now();
  var dd = d.timeZoneOffset;
  var zoneOffsetClass = JClass.forName('java.time.ZoneOffset');
  var ofHours = zoneOffsetClass.staticMethodId(r'ofHours', r'(I)Ljava/time/ZoneOffset;');
  var zoneOffset = ofHours.call(zoneOffsetClass, JObject.type, [dd.inHours]);
  return zoneOffset;
}