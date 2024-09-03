import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {

  //theme
  static const THEME_STATUS = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
    getTranslate();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
    notifyListeners();
    return _darkTheme;
  }


// translate

  String _arabic = 'ar';
  String get getIsArabic => _arabic;
  static const TRANSLATE_STATUS = "TRANSLATE_STATUS";


  Future<void> setArabic({required String translate}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TRANSLATE_STATUS, translate);
    _arabic = translate;
    notifyListeners();
  }



  Future<String> getTranslate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _arabic = prefs.getString(TRANSLATE_STATUS) ?? 'en';
    notifyListeners();
    return _arabic;
  }






}
