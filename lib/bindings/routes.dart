import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/screens/spelling_bee/spelling_bee_game_screen.dart';

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
      name: AppRouteNames.spellingBeeGameScreen,
      page: () => SpellingBeeScreen(),
    ),
  ];
}
