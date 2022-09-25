import 'package:flutter/material.dart';

import 'color/app_color.dart';

class AppTheme {
  AppTheme._();

  static const String fontName = 'Cabin';

  static TextTheme textTheme = const TextTheme(
    headline4: AppTheme.display1,
    headline5: AppTheme.headline,
    headline1: AppTheme.title,
    subtitle1: AppTheme.subtitle,
    bodyText2: AppTheme.body2,
    bodyText1: AppTheme.body1,
    caption: AppTheme.caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
  );
  static const TextStyle headline = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
  );

  static double mainPadding = 20.00;
  static double doublePadding = 32.00;
  static double halfPadding = 12.00;
  static double mainBorderRadiusValue = 16.0;
  static BorderRadius mainBorderRadius = BorderRadius.circular(
    mainBorderRadiusValue,
  );

  static const LinearGradient addButtonGradient = LinearGradient(
    colors: <Color>[Colors.blue, Colors.blueGrey],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const List<BoxShadow> boxShadows = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(6, 2),
      blurRadius: 6.0,
      spreadRadius: 3.0,
    ),
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, 0.4),
      offset: Offset(-6, -2),
      blurRadius: 6.0,
      spreadRadius: 3.0,
    )
  ];

  static final List<BoxShadow> menuShadow = [
    BoxShadow(
      color: AppColor.instance.white.withOpacity(0.5),
      offset: const Offset(-12, 20),
      spreadRadius: 3.0,
    )
  ];

  static List<BoxShadow> buttonGlow = [
    BoxShadow(
      color: AppColor.instance.lightPrimaryColor.withOpacity(0.3),
      offset: const Offset(0, 6),
      blurRadius: 12.0,
      spreadRadius: 6.0,
    )
  ];

  static const Duration pageDuration = Duration(milliseconds: 300);
}
