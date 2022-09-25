// ignore_for_file: constant_identifier_names

enum Day {
  Pazartesi,
  Sali,
  Carsamba,
  Persembe,
  Cuma,
  Cumartesi,
  Pazar,
}

extension ExtensionDay on Day {
  String get name {
    switch (this) {
      case Day.Pazartesi:
        return "Pazartesi";
      case Day.Sali:
        return "Salı";
      case Day.Carsamba:
        return "Çarşamba";
      case Day.Persembe:
        return "Perşembe";
      case Day.Cuma:
        return "Cuma";
      case Day.Cumartesi:
        return "Cumartesi";
      case Day.Pazar:
        return "Pazar";
    }
  }
}
