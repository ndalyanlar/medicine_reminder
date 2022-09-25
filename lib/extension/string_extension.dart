import 'package:flutter/material.dart';

extension ExtensionToTimeOfDay on String {
  TimeOfDay toTimeOfDay() {
    int hour = substring(0, indexOf(":")).toInt();
    int minute = substring(indexOf(":") + 1).toInt();
    return TimeOfDay(hour: hour, minute: minute);
  }
}

extension ExtensionTimeOfDayFromString on String {
  String fromTimeOfDay() {
    String startTime = replaceAll("TimeOfDay(", "");
    startTime = startTime.replaceAll(")", "");
    return startTime;
  }
}

extension ExtensionToInt on String? {
  int toInt() {
    if (this == "" || this == null) {
      return 0;
    } else {
      return int.parse(this!);
    }
  }
}

extension ExtensionFormatDateForApi on String {
  DateTime convertFromApi() {
    int day = split("-")[0].toInt();
    int month = split("-")[1].toInt();
    int year = split("-")[2].toInt();
    return DateTime(year, month, day);
  }
}
