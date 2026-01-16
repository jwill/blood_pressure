import 'package:blood_pressure_app/src/color_schemes.g.dart';

import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_tab_view.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:signals/signals_flutter.dart';

import 'feature/blood_pressure_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'package:permission_handler/permission_handler.dart';

// final healthConnectSignal = signal(false);

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.settingsController, required this.signal});

  final SettingsController settingsController;
  final BPRecordSignal signal;



  @override
  Widget build(BuildContext bcontext) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.


    return SignalProvider<BPRecordSignal>(
        create: () => signal,
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
