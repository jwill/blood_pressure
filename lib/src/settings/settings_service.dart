import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local storage.
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt('themeMode') ?? 0;
    return ThemeMode.values[index];
  }

  /// Persists the user's preferred ThemeMode to local storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', theme.index);
  }

  /// Loads the User's preferred filtering mode.
  Future<bool> showLowestOnly() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('showLowestOnly') ?? false;
  }

  /// Persists the user's preferred filtering mode.
  Future<void> updateShowLowestOnly(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showLowestOnly', value);
  }
}
