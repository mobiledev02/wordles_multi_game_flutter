import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Shared Preference Keys

  static const String _kinitScreen = 'initScreen';

  static bool initScreen = true;

  static SharedPreferences? _prefs;

  // Load saved data...
  static Future<void> loadSavedData() async {
    _prefs = await SharedPreferences.getInstance();

    initScreen = getOnBoardingInit();
  }

  //!------------------------------------------------- OnBoarding --------------------------------------------------//

  static void setOnBoardingInit({required bool isInit}) {
    _prefs?.setBool(_kinitScreen, isInit);
  }

  static bool getOnBoardingInit() {
    bool initScreen = _prefs?.getBool(_kinitScreen) ?? true;

    return initScreen;
  }
}
