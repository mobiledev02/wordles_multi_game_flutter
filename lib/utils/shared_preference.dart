import 'dart:core';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordles_multi_game_flutter/screens/spelling_bee/controller/spelling_bee_controller.dart';
import 'package:wordles_multi_game_flutter/screens/wordles/controller/wordles_controller.dart';

class SharedPreferencesHelper {
  // Shared Preference Keys

  static const String _kinitScreen = 'initScreen';
  static const String _kWordlesHint = 'wordlesHint';
  static const String _kSpellingBeeHint = 'spellingBeeHint';

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

  //!------------------------------------------------- Wordles Hint --------------------------------------------------//
  static void setWordlesHint({required int hintCount}) {
    _prefs?.setInt(_kWordlesHint, hintCount).then(
      (value) {
        Get.find<WordlesController>().updateHintCountBuilder();
      },
    );
  }

  static int getWordlesHint() {
    return _prefs?.getInt(_kWordlesHint) ?? 3;
  }
  //!------------------------------------------------- SpellingBee Hint --------------------------------------------------//

  static void setSpellingBeeHint({required int hintCount}) {
    _prefs?.setInt(_kSpellingBeeHint, hintCount).then(
      (value) {
        Get.find<SpellingBeeController>().updateHintCountBuilder();
      },
    );
  }

  static int getSpellingBeeHint() {
    return _prefs?.getInt(_kSpellingBeeHint) ?? 3;
  }
}
