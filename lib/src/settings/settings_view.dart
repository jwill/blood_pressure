import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          children: [
            Row(
              children: [
                const Text("Brightness"),
                const Spacer(),
                DropdownButton<ThemeMode>(
                  // Read the selected themeMode from the controller
                  value: controller.themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: controller.updateThemeMode,
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    )
                  ],
                ),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  onPressed: () {
                    controller.loadFile();
                    Navigator.pop(context);
                  },
                  child: const Text("Load Data")),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.secondary),
                  onPressed: controller.saveFile,
                  child: const Text("Export Data")),
            ),
            const SizedBox(
              height: 64,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error),
                    onPressed: () async {},
                    child: const Text("Clear Data")))
          ],
        ),
      ),
    );
  }
}
