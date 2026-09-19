# Convert jnigen from YAML to Dart

This guide describes how to migrate from `jnigen.yaml` to a `tool/jnigen.dart` file, which is the current preferred way to configure `jnigen`.

## 1. Create the Tool Script
Create `tool/jnigen.dart` with the following structure:

```dart
import 'dart:io';
import 'package:jnigen/jnigen.dart';

void main(List<String> args) {
  final packageRoot = Platform.script.resolve('../');
  generateJniBindings(
    Config(
      outputConfig: OutputConfig(
        dartConfig: DartCodeOutputConfig(
          // Define the output path for your generated Dart files.
          path: packageRoot.resolve('lib/gen/'), 
          structure: OutputStructure.packageStructure,
        ),
      ),
      androidSdkConfig: AndroidSdkConfig(
        addGradleDeps: true,
        addGradleSources: false,
      ),
      // List the fully qualified Java/Kotlin class names you want to bind here.
      classes: [
        'android.content.Intent',
        // 'com.yourpackage.YourClass',
      ],
    ),
  );
}
```

## 2. Dependencies
Ensure your `pubspec.yaml` includes `jnigen` in `dev_dependencies`.

## 3. Usage
Instead of running `dart run jnigen --config jnigen.yaml`, run:

```bash
dart run tool/jnigen.dart
```

## 4. Cleaning Up
Once you have verified the generation works as expected, you can safely remove `jnigen.yaml`.
