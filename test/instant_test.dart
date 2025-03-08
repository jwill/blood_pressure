import 'dart:io';

import 'package:blood_pressure_app/health_connect/kotlin/random/_package.dart';
import 'package:blood_pressure_app/jni_utils.dart';
import 'package:jni/jni.dart';
import 'package:test/test.dart';

import 'test_utils/test_util.dart';


void main() {
  // Don't forget to initialize JNI.
  if (!Platform.isAndroid) {
    spawnJvm();
  }
  run(testRunner: test);
}

void run({required TestRunnerCallback testRunner}) {
  testRunner('java.time.Instant', (){
      final now = JInstantExt.now();
      final dateTimeNow = DateTime.now();
      print(now);
      print(dateTimeNow);
      expect(now.toString(), dateTimeNow);
      now.release();
  });
  testRunner('java.time.Instant - of Epoch', (){
    final now = JInstantExt.now();
    final millis = DateTime.now().millisecondsSinceEpoch;
    print(DateTime.now().millisecondsSinceEpoch);

    final instant = JInstantExt.ofEpochMilli(millis.toJLong());


    expect(instant, now);
    now.release();
  });
  testRunner('ddd', (){
    var clazz = JClass.forName('kotlin/String');
    print(clazz);
    print(Random.Default.nextDouble1(6.0));
    print(Random.Default.nextDouble1(6.0));
    print(Random.Default.nextDouble1(6.0));

  });
}