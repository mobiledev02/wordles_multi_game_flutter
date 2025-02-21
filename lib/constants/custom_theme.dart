import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/text_style_decoration.dart';
import '../constants/textfield_decoration.dart';

class CustomAppTheme {
  static final int _primaryColor = 0xFFFFFFFF;

  static int get primaryColor => _primaryColor;

  static const Color _accentColor = Color(0xFF808080);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _materialPrimary,
    buttonTheme: ButtonThemeData(
      buttonColor: Color(_primaryColor),
      disabledColor: const Color(0xFFF4F4F4),
    ),
    unselectedWidgetColor: const Color(0xffF4F4F4),
    dividerColor: const Color(0xFFE4E4E4),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE4E4E4),
      thickness: 1,
    ),
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
        backgroundColor: Colors.white, surfaceTintColor: Colors.white),
    textTheme: TextStyleDecoration.lightTheme,
    primaryTextTheme: TextStyleDecoration.lightTheme,
    inputDecorationTheme: TextFieldDecoration.getOutLineInputDecoration,
    fontFamily: TextStyleDecoration.fontFamily,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Color(_primaryColor),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        color: Color(_primaryColor),
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      selectedIconTheme: IconThemeData(
        color: Color(_primaryColor),
      ),
      enableFeedback: true,
      selectedItemColor: Color(_primaryColor),
      unselectedItemColor: Colors.black,
      unselectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 2.0),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        fixedSize:
            WidgetStateProperty.all<Size>(const Size(double.maxFinite, 50.0)),
        elevation: WidgetStateProperty.all<double>(0.0),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xffF4F4F4);
            }
            return Colors.transparent; // Use the component's default.
          },
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(33.0),
            ),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          const Size(double.maxFinite, 32.0),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: Color(_primaryColor), width: 1.5),
        ),
        textStyle: WidgetStateProperty.all<TextStyle?>(
          TextStyleDecoration.lightTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.symmetric(horizontal: 5.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme(
      error: Colors.red,
      brightness: Brightness.light,
      onError: Colors.red,
      onSecondary: _accentColor,
      primary: Color(_primaryColor),
      onSurface: Colors.white,
      secondary: _accentColor,
      onPrimary: Color(_primaryColor),
      surface: Colors.white,
    ).copyWith(onSurface: _materialPrimary, surface: Colors.white),
  );

  //------------------------------ Material Color------------------------//

  static final MaterialColor _materialPrimary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(_primaryColor),
      100: Color(_primaryColor),
      200: Color(_primaryColor),
      300: Color(_primaryColor),
      400: Color(_primaryColor),
      500: Color(_primaryColor),
      600: Color(_primaryColor),
      700: Color(_primaryColor),
      800: Color(_primaryColor),
      900: Color(_primaryColor),
    },
  );
}
