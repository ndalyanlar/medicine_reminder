import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_reminder/extension/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/share_preferences.dart';
import '../enum/day.dart';
import '../enum/period.dart';
import '../model/medicine.dart';
import '../widget/time_text_field.dart';

class PillModelView extends ChangeNotifier {
  late Medicine medicine;
  List<String> selectedDays =
      List.generate(Day.values.length, (index) => Day.values[index].name);
  TimeOfDay? selectedTime24Hour = TimeOfDay.fromDateTime(DateTime.now());
  String get clockText => "${selectedTime24Hour!.hour}:$getFilteredMinute";
  List<bool> isVisibleTimeTextFieldList = [true, false, false, false, false];
  late List<TextEditingController> timeTextFieldControllerList;
  TextEditingController pillNameFieldController = TextEditingController();
  Period selectedType = Period.EveryDay;
  late List<TimeTextfield> timeTextFieldList;
  GlobalKey<FormState> textFieldNameKey = GlobalKey<FormState>();

  PillModelView() {
    timeTextFieldControllerList = [
      TextEditingController(text: clockText),
      TextEditingController(text: clockText),
      TextEditingController(text: clockText),
      TextEditingController(text: clockText),
      TextEditingController(text: clockText)
    ];

    timeTextFieldList = [
      TimeTextfield(textEditingController: timeTextFieldControllerList[0]),
      TimeTextfield(textEditingController: timeTextFieldControllerList[1]),
      TimeTextfield(textEditingController: timeTextFieldControllerList[2]),
      TimeTextfield(textEditingController: timeTextFieldControllerList[3]),
      TimeTextfield(textEditingController: timeTextFieldControllerList[4])
    ];
  }

  void reset() {
    selectedDays.clear();
    selectedDays =
        List.generate(Day.values.length, (index) => Day.values[index].name);
    selectedTime24Hour = TimeOfDay.fromDateTime(DateTime.now());
    isVisibleTimeTextFieldList = [true, false, false, false, false];
    timeTextFieldControllerList[0].text = clockText;
    pillNameFieldController = TextEditingController();
    selectedType = Period.EveryDay;
    notifyListeners();
  }

  void changeDaysView(Period period) {
    selectedType = period;
    notifyListeners();
  }

  Future<void> addReminder(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> times = [];
    List<String> pillNamesList = [];
    String pillNameListKey = ConstantSharedPreferences.keyPillNameList;

    times = _checkIsVisibleTimeTextField(times);

    assignMedicine(times);

    if (preferences.getStringList(pillNameListKey) != null) {
      pillNamesList = preferences.getStringList(pillNameListKey)!;
      late bool isThere = false;

      isThere = checkPillNames(pillNamesList, isThere);

      if (isThere) {
        await _showConfirmDialog(context, preferences);

        //Var
      } else {
        //Yokk

        await _cacheChangeValue(pillNamesList, preferences);
      }
    } else {
      await _cacheChangeValue(pillNamesList, preferences);
    }

    notifyListeners();
  }

  List<String> _checkIsVisibleTimeTextField(List<String> times) {
    for (int x = 0; x < isVisibleTimeTextFieldList.length; x++) {
      bool isVisible = isVisibleTimeTextFieldList[x];
      if (isVisible) {
        String time = timeTextFieldControllerList[x].text;
        times.add(time.toTimeOfDay().toString());
        times = times.toSet().toList();
      }
    }
    return times;
  }

  void assignMedicine(List<String> times) {
    medicine = Medicine(
      notificationIDs: [],
      medicineName: pillNameFieldController.text,
      remindTimeList: times,
      days: selectedDays,
    );
  }

  Future<void> _cacheChangeValue(
      List<String> pillNamesList, SharedPreferences preferences) async {
    pillNamesList.add(medicine.getName);
    await preferences.setStringList(
        ConstantSharedPreferences.keyPillNameList, pillNamesList);
    await preferences.setString(
        medicine.getName, jsonEncode(medicine.toJson()));
  }

  Future<void> _showConfirmDialog(
      BuildContext context, SharedPreferences preferences) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Uyarı'),
        content:
            const Text('Bu ilaç listede mevcut değiştirmek istiyormusunuz ?'),
        actions: <Widget>[
          // TextButton(
          //   onPressed: () async =>
          //       await context.replaceRoute(const PillListRoute()),
          //   child: const Text('Hayır'),
          // ),
          TextButton(
            onPressed: () async {
              await preferences.remove(medicine.getName);
              await preferences.setString(
                  medicine.getName, jsonEncode(medicine.toJson()));

              // context.replaceRoute(const PillListRoute());
            },
            child: const Text('Evet'),
          ),
        ],
      ),
    );
  }

  bool checkPillNames(List<String> pillNamesList, bool isThere) {
    pillNamesList.toList().forEach((element) {
      element.toLowerCase() == medicine.getName.toLowerCase()
          ? isThere = true
          : null;
    });
    return isThere;
  }

  void removeDay(String value) {
    selectedDays.remove(value);
    notifyListeners();
  }

  void addDay(String value) {
    selectedDays.add(value);
    selectedDays = selectedDays.toSet().toList();
    notifyListeners();
  }

  Future<List<Medicine>?> fetchAllDatas() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.clear();
    List<Medicine> medicineList = [];
    Medicine? medicine;
    if (preferences.getStringList(ConstantSharedPreferences.keyPillNameList) !=
        null) {
      List<String> pillNameList =
          preferences.getStringList(ConstantSharedPreferences.keyPillNameList)!;

      if (pillNameList.isNotEmpty) {
        for (String name in pillNameList) {
          medicine =
              Medicine.fromJson(jsonDecode(preferences.getString(name)!));

          medicineList.add(medicine);
        }
        return medicineList;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String get getFilteredMinute {
    if (selectedTime24Hour!.minute.toString().characters.length == 1) {
      return "0${selectedTime24Hour!.minute}";
    } else {
      return selectedTime24Hour!.minute.toString();
    }
  }
}

final providerPillViewModel = ChangeNotifierProvider((ref) => PillModelView());
