import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_key.dart';

class LocalStorage {
  Future<String?> getString(String localStorageKey) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(localStorageKey);
    return result;
  }

  Future<bool> setString(
    String value, {
    required String localStorageKey,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(localStorageKey, value);
  }

  Future<bool?> getBool(String localStorageKey) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(localStorageKey);
    return result;
  }

  Future<bool> setBool(
    String localStorageKey,
    bool value,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(localStorageKey, value);
  }

  Future<int?> getInt(String localStorageKey) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(localStorageKey);
    return result;
  }

  Future<bool> setInt(
    String localStorageKey,
    int value,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(localStorageKey, value);
  }

  Future<bool> remove({required String localStorageKey}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(localStorageKey);
  }
}
