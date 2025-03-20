// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:jni/jni.dart';
import 'package:jni/src/build_util/build_util.dart';

typedef TestCaseCallback = void Function();
typedef TestRunnerCallback = void
    Function(String description, TestCaseCallback test, {Object? skip});

final currentDir = Directory.current.uri;
final dllSuffix =
    Platform.isWindows ? 'dll' : (Platform.isMacOS ? 'dylib' : 'so');
final dllPrefix = Platform.isWindows ? '' : 'lib';
final dllPath =
    currentDir.resolve('build/jni_libs/${dllPrefix}dartjni.$dllSuffix');

void spawnJvm() {
  Jni.spawnIfNotExists(
      dylibDir: 'build/jni_libs', jvmOptions: ['-Xmx128m', '-Xcheck:jni']);
}
