import 'package:get/get.dart';

class SpellingBeeController extends GetxController {
  String updateHint = "update_hint";
  String updateLatter = "update_Latter";

  List<String> letterList = ['A', 'P', 'N', 'E', 'Y', 'M'];
  String centerLetter = "T";

  void updateHintCountBuilder() {
    update([updateHint]);
  }

  void updateLatterBuilder() {
    update([updateLatter]);
  }
}
