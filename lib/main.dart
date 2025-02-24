import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/utils/shared_preference.dart';

import 'bindings/bindings.dart';
import 'bindings/route_names.dart';
import 'bindings/routes.dart';
import 'constants/custom_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferencesHelper.loadSavedData();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? get getContext => navigatorKey.currentState?.context;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Wordles Multi Game',
          // navigatorObservers: [FirebaseAnalyticsHelper.observer],
          theme: CustomAppTheme.lightTheme,
          initialBinding: MainBindings(),
          initialRoute: AppRouteNames.homeScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
