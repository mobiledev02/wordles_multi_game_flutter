import 'package:get/get.dart';

class SpellingBeeController extends GetxController {
  String updateHint = "update_hint";
  String updateLatter = "update_Latter";

  void updateHintCountBuilder() {
    update([updateHint]);
  }

  void updateLatterBuilder() {
    update([updateLatter]);
  }
}
