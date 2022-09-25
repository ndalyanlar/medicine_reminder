import 'package:flutter/material.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding.symetric({Key? key, double? vertical, double? horizontal})
      : super.symmetric(vertical: vertical ?? 10, horizontal: horizontal ?? 25);

  const CustomPadding.all({double? padding}) : super.all(padding ?? 20);

  const CustomPadding.only(
      {double? bottom, double? top, double? left, double? right})
      : super.only(
          bottom: bottom ?? 10,
          top: top ?? 10,
          left: left ?? 10,
          right: right ?? 10,
        );

  static EdgeInsets minPaddingAll = const EdgeInsets.all(8);
  static EdgeInsets maxPaddingAll = const EdgeInsets.all(16);

  static double maxPadding = 16.0;
  static double minPadding = 8.0;

  static EdgeInsets minPaddingHorizontal =
      const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets maxPaddingHorizontal =
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets minPaddingVertical =
      const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets maxPaddingVertical =
      const EdgeInsets.symmetric(vertical: 16);

  static EdgeInsets minPaddingTop = const EdgeInsets.only(top: 8);
  static EdgeInsets maxPaddingTop = const EdgeInsets.only(top: 16);

  static EdgeInsets minPaddingBottom = const EdgeInsets.only(bottom: 8);
  static EdgeInsets maxPaddingBottom = const EdgeInsets.only(bottom: 16);

  static EdgeInsets minPaddingLeft = const EdgeInsets.only(left: 8);
  static EdgeInsets maxPaddingLeft = const EdgeInsets.only(left: 16);

  static EdgeInsets minPaddingRight = const EdgeInsets.only(right: 8);
  static EdgeInsets maxPaddingRight = const EdgeInsets.only(right: 16);

  static EdgeInsets minPaddingTopLeft = const EdgeInsets.only(top: 8, left: 8);
  static EdgeInsets maxPaddingTopLeft =
      const EdgeInsets.only(top: 16, left: 16);

  static EdgeInsets minPaddingTopRight =
      const EdgeInsets.only(top: 8, right: 8);
  static EdgeInsets maxPaddingTopRight =
      const EdgeInsets.only(top: 16, right: 16);

  static EdgeInsets minPaddingBottomLeft =
      const EdgeInsets.only(bottom: 8, left: 8);
  static EdgeInsets maxPaddingBottomLeft =
      const EdgeInsets.only(bottom: 16, left: 16);

  static EdgeInsets minPaddingBottomRight =
      const EdgeInsets.only(bottom: 8, right: 8);
  static EdgeInsets maxPaddingBottomRight =
      const EdgeInsets.only(bottom: 16, right: 16);

  static EdgeInsets mixPaddingOnly(
          {double? top, double? left, double? bottom, double? right}) =>
      EdgeInsets.only(
          top: top ?? 8,
          left: left ?? 8,
          bottom: bottom ?? 8,
          right: right ?? 8);

  static EdgeInsets mixPaddingSymmetric(
          {double? horizontal, double? vertical}) =>
      EdgeInsets.symmetric(
          vertical: vertical ?? 10, horizontal: horizontal ?? 20);
}
