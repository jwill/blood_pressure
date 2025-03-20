

import 'dart:ffi';

import 'package:blood_pressure_app/health_connect/java/time/_package.dart';
import 'package:jni/jni.dart';

ZoneOffset getZoneOffset() {
  // Get current time
  DateTime d = DateTime.now();
  var dd = d.timeZoneOffset.inHours;
  return ZoneOffset.ofHours(dd)!;
}