import 'dart:io';

import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/permission/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/records/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/records/metadata/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/request/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/response/ReadRecordsResponse.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/time/_package.dart';
import 'package:blood_pressure_app/health_connect/java/time/_package.dart';
import 'package:blood_pressure_app/health_connect/kotlin/jvm/_package.dart';
import 'package:blood_pressure_app/jni_utils.dart';
import 'package:blood_pressure_app/src/color_schemes.g.dart';

import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_tab_view.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jni/jni.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:signals/signals_flutter.dart';
import 'package:flutter/services.dart';

import 'feature/blood_pressure_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

final healthConnectSignal = signal(false);

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.settingsController, required this.signal});

  final SettingsController settingsController;
  final BPRecordSignal signal;
  final Signal packageSignal = Signal("");
  HealthConnectClient? healthConnectClient;
  static const platform = MethodChannel('androidx.healthconnect');

  Future<bool?> hasAllPermissions(Set<JString> permissions) async {
    var perms = await healthConnectClient
        ?.getPermissionController()
        .getGrantedPermissions();
    return perms?.containsAll(permissions);
  }

  static int? argbFromHex(String hex) {
    return int.tryParse(hex.replaceAll('#', ''), radix: 16);
  }

  void requestPermission() {}

  Future<void> _checkHealthConnectPermissions() async {
    var perms = await healthConnectClient
        ?.getPermissionController()
        .getGrantedPermissions();

    var x = JvmClassMappingKt.getKotlinClass(BloodPressureRecord.type.jClass,
        T: BloodPressureRecord.type);

    var PERMISSIONS = {
      HealthPermission.getReadPermission(x),
      HealthPermission.getWritePermission(x)
    };
    try {
      final result = await platform.invokeMethod('checkPermissions');
      healthConnectSignal.value = result;
    } on PlatformException catch (ex) {}
  }

  Future<ReadRecordsResponse<BloodPressureRecord>> readBloodPressureRecords(
      HealthConnectClient client, DateTime start, DateTime end) async {
    var kClass = JvmClassMappingKt.getKotlinClass(
        BloodPressureRecord.type.jClass,
        T: BloodPressureRecord.type);
    var ascendingOrder = false;
    var pageSize = 10;

    // Get package from property or something for the data origin
    var request = ReadRecordsRequest(
        kClass,
        TimeRangeFilter.between(start.toInstant(), end.toInstant()),
        <DataOrigin>[].toJSet(DataOrigin.type),
        ascendingOrder,
        pageSize,
        "0".toJString(),
        0,
        T: BloodPressureRecord.type);

    var response = client.readRecords(request);
    return response;
  }

  @override
  Widget build(BuildContext bcontext) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    if (Platform.isAndroid) {
      PackageInfo.fromPlatform().then((PackageInfo info) {
        packageSignal.value = info.packageName;
      });

      JObject context =
          JObject.fromReference(Jni.getCachedApplicationContext());

      _checkHealthConnectPermissions().then((onValue) {
        print(healthConnectSignal.value);
      });

      final String healthConnectPackageName =
          "com.google.android.apps.healthdata";
      var permissions = {
        'android.permission.health.READ_BLOOD_PRESSURE'.toJString(),
        'android.permission.health.WRITE_BLOOD_PRESSURE'.toJString()
      }.toJSet(JString.type);

      var availabilityStatus = HealthConnectClient.getSdkStatus(
          context, healthConnectPackageName.toJString());
      if (availabilityStatus == HealthConnectClient.SDK_UNAVAILABLE) {
        print("SDK Unavailable");
      }
      print(availabilityStatus);
      var healthConnectClient = HealthConnectClient.getOrCreate$1(context);

      healthConnectClient
          .getPermissionController()
          .getGrantedPermissions()
          .then((onValue) {
        print("perms");
        print(onValue);
        print(onValue.containsAll(permissions));
      });

      var y = readBloodPressureRecords(
          healthConnectClient,
          DateTime.now().subtract(Duration(days: 10)),
          DateTime.now().add(Duration(days: 10)));
      y.then((x) {
        print("records");
        print(x.getPageToken());
        print(x.getRecords());
      });
    }

    return SignalProvider<BPRecordSignal>(
        create: () => BPRecordSignal([], 'records'),
        child: ListenableBuilder(
          listenable: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              restorationScopeId: 'app',
              theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              themeMode: settingsController.themeMode,
                debugShowCheckedModeBanner: false,
              // Define a function to handle named routes in order to support
              // Flutter web url navigation and deep linking.
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsView.routeName:
                        return SettingsView(controller: settingsController);
                      case BloodPressureItemDetailsView.routeName:
                        return BloodPressureItemDetailsView();
                      case BloodPressureTabView.routeName:
                        return BloodPressureTabView();
                      default:
                        return BloodPressureListView();
                    }
                  },
                );
              },
            );
          },
        ));
  }
}
