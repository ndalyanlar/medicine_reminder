import 'package:flutter/material.dart';

class OnboardingConst {
  static final OnboardingConst _instance = OnboardingConst._init();
  static OnboardingConst get instance => _instance;
  OnboardingConst._init();

  String onboardingBottomButtonText = "Geç";
  String onboardingUpText1 = "Test Başlık 1";
  String onboardingUpText2 = "Test Başlık 2";
  String onboardingUpText3 = "Test Başlık 3";
  String onboardingDownText1 = """Test Metin 1""";
  String onboardingDownText2 = """Test Metin 2""";
  String onboardingDownText3 = """Test Metin 3""";
  String onboardingPicPath1 = 'asset/onboarding_images/ic_patient_1.png';
  String onboardingPicPath2 = 'asset/onboarding_images/ic_patient_2.png';
  String onboardingPicPath3 = 'asset/onboarding_images/ic_patient_3.png';

  TextStyle textStyleUp({fontSize = 22.0, color = Colors.black}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
  TextStyle textStyleDown({fontSize = 15.0, color = Colors.black}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
}
