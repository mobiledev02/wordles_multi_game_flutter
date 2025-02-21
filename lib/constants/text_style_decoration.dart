import 'package:flutter/material.dart';

import '/constants/constant_font.dart';

// labelSmall : 10.0
// bodySmall  : 12.0
// bodyLarge: 14.0
// bodyMedium: 16.0
// displayLarge: 18.0
// displayMedium: 20.0
// displaySmall: 22.0
// headlineMedium: 24.0
// headlineSmall: 26.0
// titleLarge: 28.0

// W100 - thin,
// W200 - extra light.
// W300 - light,
// W400 - normal, regular plain,
// W500 - medium,
// W600 - semi-bold,
// W700 - bold,
// W800 - extra bold,
// W900 - black, ,most thick.

class TextStyleDecoration {
  // App Default font...
  static const String fontFamily = ConstantFont.defaultFontFamily;
  // static const String fontFamily = "";

  static TextStyle errorStyle = const TextStyle(
    fontFamily: TextStyleDecoration.fontFamily,
    color: Colors.red,
    fontSize: 14.0, //.sp,
    fontWeight: FontWeight.w500,
  );

  static Color fontColor = Colors.black;

  // static TextStyle hintTextStyle = TextStyle(
  //   color: Color(0xFF929292),
  //   fontSize: 16.0, //.sp,
  //   fontFamily: fontFamily,
  //   fontWeight: FontWeight.w500,
  // );

  // static const TextStyle labelTextStyle = TextStyle(
  //   color: fontColor,
  //   fontFamily: fontFamily,
  //   fontSize: 16.0, //.sp,
  //   fontWeight: FontWeight.w500,
  // );

  // Get Text theme...
  static TextTheme get lightTheme => TextTheme(
        labelSmall: _labelSmall, // 10.0
        bodySmall: _bodySmall, // 12.0
        bodyMedium: _bodyMedium, // 14.0
        bodyLarge: _bodyLarge, // 16.0
        displayLarge: _displayLarge, // 22.0
        displayMedium: _displayMedium, // 20.0
        displaySmall: _displaySmall, // 18.0
        headlineSmall: _headlineSmall, // 24.0
        headlineMedium: _headlineMedium, // 26.0
        headlineLarge: _headlineLarge, // 28.0
        titleLarge: _titleLarge, // 28.0
        titleMedium:
            _subTitle, // 16.0 this is also used when no style is given to textfield..
        titleSmall: _subHeadline, // 16.0
        labelLarge: _labelLarge, // 16.0
      );

  static final _labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static final _bodySmall = TextStyle(
    fontFamily: fontFamily,
    color: fontColor,
    fontSize: 12, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle _bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _headlineMedium = TextStyle(
    fontFamily: fontFamily,
    color: fontColor,
    fontSize: 26, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final _headlineSmall = TextStyle(
    fontFamily: fontFamily,
    color: fontColor,
    fontSize: 24, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final _headlineLarge = TextStyle(
    fontFamily: fontFamily,
    color: fontColor,
    fontSize: 28, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final _titleLarge = TextStyle(
    fontFamily: fontFamily,
    color: fontColor,
    fontSize: 28, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final _subTitle = TextStyle(
    color: fontColor,
    fontFamily: fontFamily,
    fontSize: 16, //.sp,
    fontWeight: FontWeight.w500,
  );

  static final _subHeadline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16, //.sp,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final _labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16, //.sp,
    letterSpacing: 3,
    color: fontColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get hintTextStyle => const TextStyle(
        fontFamily: fontFamily,
        fontSize: 15, //.sp,
        color: Color(0xFF84828A),
        fontWeight: FontWeight.w400,
      );

  static TextStyle get labelTextStyle => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16, //.sp,
        color: fontColor,
        fontWeight: FontWeight.w500,
      );
}
