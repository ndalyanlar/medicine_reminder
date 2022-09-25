class ConstantReminder {
  static ConstantReminder? _instance;
  static ConstantReminder get instance {
    _instance ??= ConstantReminder._init();
    return _instance!;
  }

  ConstantReminder._init();
}
