class Medicine {
  final List<dynamic> notificationIDs;
  final String medicineName;
  final List<dynamic> remindTimeList;
  final List<dynamic> days;

  Medicine({
    required this.notificationIDs,
    required this.medicineName,
    required this.remindTimeList,
    required this.days,
  });

  String get getName => medicineName;
  List get getRemindTimeList => remindTimeList;
  List<dynamic> get getIDs => notificationIDs;
  List get getDays => days;

  Map<String, dynamic> toJson() {
    return {
      "ids": notificationIDs,
      "name": medicineName,
      "times": remindTimeList,
      "days": days,
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      notificationIDs: parsedJson['ids'],
      medicineName: parsedJson['name'],
      remindTimeList: parsedJson['times'],
      days: parsedJson["days"],
    );
  }

  @override
  String toString() {
    return 'ids: $notificationIDs \nname: $medicineName \nremindTimeList: $remindTimeList \ndays: $days';
  }
}
