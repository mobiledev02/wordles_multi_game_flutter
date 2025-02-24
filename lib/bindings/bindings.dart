import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/screens/spelling_bee/controller/spelling_bee_controller.dart';
import 'package:wordles_multi_game_flutter/screens/wordles/controller/wordles_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() async {}
}

class WordlesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WordlesController>(() => WordlesController());
  }
}

class SpellingBeeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpellingBeeController>(() => SpellingBeeController());
  }
}
