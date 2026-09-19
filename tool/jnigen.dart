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
      // Add your target Java/Kotlin classes here.
      classes: [
        'androidx.health.connect.client.HealthConnectClient',
        'androidx.health.connect.client.PermissionController',
        'androidx.health.connect.client.units.Pressure',
        'androidx.health.connect.client.permission.HealthPermission',
        'androidx.health.connect.client.records.BloodPressureRecord',
        'androidx.health.connect.client.records.metadata.Metadata',
        'androidx.health.connect.client.records.metadata.DataOrigin',
        'androidx.health.connect.client.response.InsertRecordsResponse',
        'androidx.health.connect.client.response.ReadRecordsResponse',
        'androidx.health.connect.client.time.TimeRangeFilter',
        'androidx.health.connect.client.request.ReadRecordsRequest',
        'androidx.activity.result.ActivityResultCallback',
        'androidx.activity.result.ActivityResult',
        'androidx.activity.result.ActivityResultLauncher',
        'androidx.activity.result.contract.ActivityResultContracts',
        'androidx.activity.ComponentActivity',
        'androidx.fragment.app.FragmentActivity',
        'android.content.Intent',
        'java.time.Instant',
        'java.time.ZoneOffset',
        'java.time.ZonedDateTime',
        // 'kotlin.jvm.JvmClassMappingKt',
      ],
    ),
  );
}
