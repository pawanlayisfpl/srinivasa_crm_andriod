import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class KeyValueStorage {
  KeyValueStorage(this.secureStorage, this.sharedPreferences);

  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  Future<bool> setString(String key, String value) =>
      sharedPreferences.setString(key, value);

  String? getString(String key) => sharedPreferences.getString(key);

  Future<void> setSecureString(String key, String value) =>
      secureStorage.write(key: key, value: value);

  Future<void> setSecureList(String key, List<String> data) =>
      sharedPreferences.setStringList(key, data);

  Future<String?> getSecureString(String key) => secureStorage.read(key: key);

  Future<List<String>?> getSecureList(String key) async =>
      sharedPreferences.getStringList(key);

  Future<void> clearValue(String key)async => await  sharedPreferences.remove(key);

  Future<void> removeValueByKey(String key) async => await sharedPreferences.remove(key);

  Future<bool> clearAllValues() => sharedPreferences.clear();

  Future<void> clearSecureValue(String key) => secureStorage.delete(key: key);

  Future<void> clearAllSecureValues() => secureStorage.deleteAll();
}
