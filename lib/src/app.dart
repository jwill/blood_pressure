import 'dart:io';

import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/permission/_package.dart';
import 'package:blood_pressure_app/health_connect/androidx/health/connect/client/records/_package.dart';
//import 'package:blood_pressure_app/health_connect/kotlin/jvm/_package.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_tab_view.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jni/jni.dart';
import 'package:jni/src/jobject.dart';
import 'package:signals/signals_flutter.dart';
import 'package:flutter/services.dart';

import 'feature/blood_pressure_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

final healthConnectSignal = signal(false);

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
   MyApp(
      {super.key, required this.settingsController, required this.signal});

  final SettingsController settingsController;
  final BPRecordSignal signal;
  HealthConnectClient? healthConnectClient;
  final requiredPermissions = JArray(JString.nullableType, 2);
  static const platform = MethodChannel('androidx.healthconnect');

  Future<bool?> hasAllPermissions(Set<JString> permissions) async {
    var perms = await healthConnectClient?.getPermissionController().getGrantedPermissions();
    return perms?.containsAll(permissions);
  }

  void requestPermission() {

  }

  /*
val requestPermission =
    activity.registerForActivityResult(
        PermissionController.createRequestPermissionResultContract()
    ) { grantedPermissions: Set<String> ->
        if (
            grantedPermissions.contains(HealthPermission.getReadPermission(StepsRecord::class))
        ) {
            // Read or process steps related health records.
        } else {
            // user denied permission
        }
    }
requestPermission.launch(setOf(HealthPermission.getReadPermission(StepsRecord::class)))
   */

   Future<void> _checkHealthConnectPermissions()  async {

     try {
       final result = await platform.invokeMethod('checkPermissions');
       healthConnectSignal.value = result;
     } on PlatformException catch(ex) {

     }
   }

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    if (Platform.isAndroid) {
      JObject context =
          JObject.fromReference(Jni.getCachedApplicationContext());

      _checkHealthConnectPermissions().then((onValue) {
        print(healthConnectSignal.value);
      });

      final String healthConnectPackageName = "com.google.android.apps.healthdata";
      var permissions = {
        'android.permission.health.READ_BLOOD_PRESSURE'.toJString(),
        'android.permission.health.WRITE_BLOOD_PRESSURE'.toJString() }
          .toJSet(JString.type);

      var availabilityStatus = HealthConnectClient.getSdkStatus(context, healthConnectPackageName.toJString());
      if(availabilityStatus == HealthConnectClient.SDK_UNAVAILABLE) {
        print("SDK Unavailable");
      }
      print(availabilityStatus);
      var healthConnectClient =
          HealthConnectClient.getOrCreate(context, JString.fromString(""));

      healthConnectClient.getPermissionController().getGrantedPermissions().then((onValue){
        print(onValue);
        print(onValue.containsAll(permissions));
      });

    }

    return SignalProvider<BPRecordSignal>(
        create: () => BPRecordSignal([], 'records'),
        child: ListenableBuilder(
          listenable: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],

              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              // Define a light and dark color theme. Then, read the user's
              // preferred ThemeMode (light, dark, or system default) from the
              // SettingsController to display the correct theme.
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                  useMaterial3: true),
              darkTheme: ThemeData.dark(),
              themeMode: settingsController.themeMode,

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
