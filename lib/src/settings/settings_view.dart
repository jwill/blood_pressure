import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

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
    final textTheme = Theme.of(context).textTheme;
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
                Text("Brightness", style: textTheme.bodyLarge,),
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
            SizedBox(
              height: 8,
            ),
            SwitchListTile(
              title: const Text('Show lowest reading per day'),
              value: controller.showLowestOnly,
              onChanged: controller.updateShowLowestOnly,
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  onPressed: () async {
                    final records = await controller.loadFile();
                    if (records != null && controller.healthConnectService.isConnected.value && context.mounted) {
                      final shouldSync = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Sync to Health Connect?'),
                          content: Text('Do you want to sync ${records.length} records to Health Connect?'),
                          actions: [
                            TextButton(child: const Text('No'), onPressed: () => Navigator.pop(context, false)),
                            TextButton(child: const Text('Yes'), onPressed: () => Navigator.pop(context, true)),
                          ],
                        ),
                      );
                      
                      if (shouldSync == true && context.mounted) {
                        await controller.healthConnectService.batchInsertBloodPressure(records);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Synced to Health Connect'))
                        );
                      }
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Load Data")),
            ),
            SizedBox(
              height: 8,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.secondary),
                  onPressed: controller.saveFile,
                  child: const Text("Export Data")),
            ),
            Watch((context) {
              final isConnected =
                  controller.healthConnectService.isConnected.value;
              final hasRecords = controller.recordsSignal.value.isNotEmpty;
              if (isConnected && hasRecords) {
                return Column(
                  children: [
                    const SizedBox(height: 8),
                    ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: double.infinity),
                        child: FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.tertiary),
                            onPressed: () async {
                              await controller.healthConnectService
                                  .batchInsertBloodPressure(
                                      controller.recordsSignal.value);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'All records synced to Health Connect')));
                              }
                            },
                            child: const Text("Sync All to Health Connect"))),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(
              height: 8,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Watch((context) {
                final isConnected = controller.healthConnectService.isConnected.value;
                return FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: isConnected ? Colors.green : colorScheme.primary,
                  ),
                  onPressed: () {
                    controller.healthConnectService.requestPermissions();
                  },
                  child: Text(isConnected ? "Connected to Health Connect" : "Connect to Health Connect"),
                );
              }),
            ),
            const SizedBox(
              height: 32,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.error),
                    onPressed: () async {
                      controller.clearRecords();
                    },
                    child: const Text("Clear Data")))
          ],
        ),
      ),
    );
  }
}
