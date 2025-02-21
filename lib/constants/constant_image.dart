import '../utils/custom_enum.dart';

class ConstantImage {
  static const imgPath = "assets/images";
  static const String crosswordsBg = "$imgPath/crosswords_bg.png";
  static const String spellingBeeBg = "$imgPath/spelling_bee_bg.png";
  static const String crosswordsScreenBg = "$imgPath/cross_words_screen_bg.png";
  static const String spellingBeeScreenBg =
      "$imgPath/spelling_bee_screen_bg.png";
  static const String crosswords = "$imgPath/cross_word.png";
  static const String spellingBee = "$imgPath/spelling_bee.png";
  static const String setting = "$imgPath/setting.png";
  static const String dot = "$imgPath/dot.png";

  static String getGamesImage(Games game) {
    String icon = "";
    switch (game) {
      case Games.theCrosswords:
        icon = crosswordsBg;
        break;
      case Games.spellingBee:
        icon = spellingBeeBg;
        break;
    }
    return icon;
  }

  static String getGamesScreenBgImage(Games game) {
    String icon = "";
    switch (game) {
      case Games.theCrosswords:
        icon = crosswordsScreenBg;
        break;
      case Games.spellingBee:
        icon = spellingBeeScreenBg;
        break;
    }
    return icon;
  }

  static String getGamesScreenImage(Games game) {
    String icon = "";
    switch (game) {
      case Games.theCrosswords:
        icon = crosswords;
        break;
      case Games.spellingBee:
        icon = spellingBee;
        break;
    }
    return icon;
  }
}
