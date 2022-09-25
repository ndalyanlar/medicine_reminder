import 'package:flutter/material.dart';
import 'package:medicine_reminder/extension/string_extension.dart';

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String formatDDMMYYYY() {
    return "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year";
  }

  DateTime fromString(String date) {
    final dateList = date.split(".");

    return DateTime(
        dateList[2].toInt(), dateList[1].toInt(), dateList[0].toInt());
  }
}
