import '../utils/custom_enum.dart';

class ConstantString {
  static const String appName = "User Authentication";
  static const String ok = 'OK';
  static const String okay = 'Okay';
  static const String continues = 'Continue';
  static const String subscribe = 'Subscribe';
  static const String mostPopular = 'MOST POPULAR';
  static const String next = 'Next';

  static const String cancel = 'Cancel';
  static const String copyRight = "Copyright";
  static const String version = 'Version';
  static const String no = "No";
  static const String yes = "Yes";
  static const String retry = "Retry";
  static const String noDetailFound = "No detail found";
  static const String skip = "Skip";
  static const String settings = "Settings";
  static const String update = "UPDATE";
  static const String save = "Save";

  //! Spelling bee variables...
  static const String spellingBeeTitle = "Spelling Bee";

  static String getGamesTitle(Games game) {
    String str = "";
    switch (game) {
      case Games.theCrosswords:
        str = "Wordles";
        break;
      case Games.spellingBee:
        str = "Spelling\nBee";
        break;
    }
    return str;
  }
}
