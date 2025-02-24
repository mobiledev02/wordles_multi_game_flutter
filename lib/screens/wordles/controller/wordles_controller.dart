import 'package:get/get.dart';

class WordlesController extends GetxController {
  String updateHint = "update_hint";
  String updateLatter = "update_Latter";

  void updateHintCountBuilder() {
    update([updateHint]);
  }

  void updateLatterBuilder() {
    update([updateLatter]);
  }
}
