import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static saveListOfStrings(
      {required String key, required List<String> value}) async {
    return await sharedPreferences.setStringList(key, value);
  }

  static dynamic getDate({required String key}) {
    return sharedPreferences.get(key);
  }

  static List<String>? getFavDate({required String key}) {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
