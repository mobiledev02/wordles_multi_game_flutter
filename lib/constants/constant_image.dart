import '../utils/custom_enum.dart';

class ConstantImage {
  static const imgPath = "assets/images";
  static const String crosswordsBg = "$imgPath/crosswords_bg.png";
  static const String spellingBeeBg = "$imgPath/spelling_bee_bg.png";
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
}
