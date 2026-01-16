import 'health_connect/java/time/_package.dart';

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
