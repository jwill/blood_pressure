import 'package:shared_preferences/shared_preferences.dart';

abstract class KeyValueStore {
  Future<void> setItem(String key, String value);
  Future<String?> getItem(String key);
  Future<void> removeItem(String key);
  Future<void> clear();
}

class InMemoryStore implements KeyValueStore {
  final Map<String, String> _store = {};

  @override
  Future<String?> getItem(String key) async {
    return _store[key];
  }

  @override
  Future<void> removeItem(String key) async {
    _store.remove(key);
  }

  @override
  Future<void> setItem(String key, String value) async {
    _store[key] = value;
  }

  @override
  Future<void> clear() async {
    _store.clear();
  }
}

class SharedPreferencesStore implements KeyValueStore {
  SharedPreferencesStore();

  SharedPreferencesAsync? prefs;

  Future<SharedPreferencesAsync> init() async {
    prefs ??= SharedPreferencesAsync();
    return prefs!;
  }

  @override
  Future<String?> getItem(String key) async {
    final prefs = await init();
    return prefs.getString(key);
  }

  @override
  Future<void> removeItem(String key) async {
    final prefs = await init();
    prefs.remove(key);
  }

  @override
  Future<void> setItem(String key, String value) async {
    final prefs = await init();
    prefs.setString(key, value);
  }

  @override
  Future<void> clear() async {
    final prefs = await init();
    prefs.clear();
  }
}
