import 'package:alert/config/app_strings.dart';

enum DosageFrequency {
  daily,
  interval,
  weekly;

  static DosageFrequency fromString(String value) {
    switch (value) {
      case AppStrings.dosageEveryDay:
        return DosageFrequency.daily;
      case AppStrings.dosageInterval:
        return DosageFrequency.interval;
      case AppStrings.dosageWeekly:
        return DosageFrequency.weekly;
      default:
        return DosageFrequency.daily;
    }
  }
}

extension DosageFrequencyExtension on DosageFrequency {
  String toPolishString() {
    switch (this) {
      case DosageFrequency.daily:
        return AppStrings.dosageEveryDay;
      case DosageFrequency.interval:
        return AppStrings.dosageInterval;
      case DosageFrequency.weekly:
        return AppStrings.dosageWeekly;
    }
  }
}
