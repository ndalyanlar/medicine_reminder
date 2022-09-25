import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double getDynamicHeight([double? value]) {
    return value == null
        ? MediaQuery.of(this).size.height
        : MediaQuery.of(this).size.height * value;
  }

  double getDynamicWidth([double? value]) {
    return value == null
        ? MediaQuery.of(this).size.width
        : MediaQuery.of(this).size.width * value;
  }
}
