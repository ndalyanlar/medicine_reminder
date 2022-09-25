// ignore_for_file: constant_identifier_names

enum Period {
  EveryDay,
  SomeDays,
}

extension ExtensionPeriod on Period {
  String get name {
    switch (this) {
      case Period.EveryDay:
        return "Her Gün";
      case Period.SomeDays:
        return "Bazı Günler";
    }
  }
}
