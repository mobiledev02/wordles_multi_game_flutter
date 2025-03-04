import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/screens/spelling_bee/models/spelling_bee_model.dart';

class SpellingBeeController extends GetxController {
  String updateHint = "update_hint";
  String updateLatter = "update_Latter";
  SpellingBeeModel spellingBeeModel = SpellingBeeModel(
    letters: [],
  );

  List<String> letterList = ['A', 'P', 'N', 'E', 'Y', 'M'];
  String centerLetter = "T";

  setLevel() {
    spellingBeeModel = spellingBeeList[64];
  }

  void updateHintCountBuilder() {
    update([updateHint]);
  }

  void updateLatterBuilder() {
    update([updateLatter]);
  }
}

//  debugPrint(letters.toString());
//     spellingBeeModel = SpellingBeeModel(
//         letters: letters.toList(),
//         centerLetter: centerLetter,
//         spellingCount: 5);
