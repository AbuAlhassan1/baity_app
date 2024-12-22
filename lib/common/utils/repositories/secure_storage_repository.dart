import 'package:baity_app/common/utils/interfaces/storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachingRepository implements CachingInterFace {

  // final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await secureStorage.delete(key: key);
    prefs.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await secureStorage.deleteAll();
    prefs.clear();
  }

  @override
  Future<String?> read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // return await secureStorage.read(key: key);
    return prefs.getString(key);
  }

  @override
  Future<Map<String, String>> readAll(Map data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // return await secureStorage.readAll();
    return prefs.getKeys().fold<Map<String, String>>({}, (acc, key) {
      acc[key] = prefs.getString(key).toString();
      return acc;
    });
  }

  @override
  Future<void> store(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await secureStorage.write(key: key, value: value);
    prefs.setString(key, value);
  }

}