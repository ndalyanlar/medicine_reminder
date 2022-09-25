import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  static final _instance = AppColor._init();
  static AppColor get instance => _instance;
  AppColor._init();

  Color lightPrimaryColor = Color.fromARGB(255, 226, 128, 7);
  Color lightSecondaryColor = const Color(0xFF00a0e2);
  Color darkPrimaryColor = const Color(0xFF07203c);
  Color darkSecondaryColor = const Color(0xFF243e57);
  Color greenDark = const Color(0xFF129090);
  Color greenLight = const Color(0xFF30c084);
  Color black = const Color(0xFF000000);
  Color white = const Color(0xFFFFFFFF);
  Color backgroundColor = const Color(0xFFF7F9FE);
  Color disabledColor = const Color(0xAAC7C6C6);
  Color transparentBgColor = const Color(0x1F5A5252);
  Color grey = const Color(0x8F7E7D7D);
  Color red = const Color(0xFFFF1100);
  Color orange = Color.fromARGB(255, 22, 162, 255);
  Color textColorDark = const Color(0xffcccccc);
  Color subTextColorDark = const Color(0xff858585);
  Color bgColorDark = const Color(0xff1e1e1e);
  Color bgSubColorDark = const Color(0xff262526);

  Color getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)]
            [Random().nextInt(9) * 10] ??
        Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100;
  }
}
