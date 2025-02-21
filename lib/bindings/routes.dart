import 'package:get/get.dart';

import '../screens/cross_word/cross_word_game_screen.dart';
import '../screens/game_intro_screen.dart';
import '../screens/home_screen.dart';
import 'bindings.dart';
import 'route_names.dart';

mixin AppRoutes {
  static final routes = [
    GetPage(
      name: AppRouteNames.homeScreen,
      page: () => const HomeScreen(),
      binding: MainBindings(),
    ),
    GetPage(
      name: AppRouteNames.gameIntroScreen,
      page: () => const GameIntroScreen(),
    ),
    GetPage(
      name: AppRouteNames.crossWordGameScreen,
      page: () => const CrossWordGameScreen(),
    ),
  ];
}
