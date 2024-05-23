import 'package:alert/config/app_strings.dart';

enum WeekDays {
  monday,
  tuesday,
  wensday,
  thursday,
  friday,
  saturday,
  sunday;
}

extension WeekDaysExtension on WeekDays {
  String toPolishString() {
    switch (this) {
      case WeekDays.monday:
        return AppStrings.monday;
      case WeekDays.tuesday:
        return AppStrings.tuesday;
      case WeekDays.wensday:
        return AppStrings.wensday;
      case WeekDays.thursday:
        return AppStrings.thursday;
      case WeekDays.friday:
        return AppStrings.friday;
      case WeekDays.saturday:
        return AppStrings.saturday;
      case WeekDays.sunday:
        return AppStrings.sunday;
    }
  }
}

extension WeekDaysStringExtension on String {
  int fromStringtoInt() {
    switch (this) {
      case AppStrings.monday:
        return 1;
      case AppStrings.tuesday:
        return 2;
      case AppStrings.wensday:
        return 3;
      case AppStrings.thursday:
        return 4;
      case AppStrings.friday:
        return 5;
      case AppStrings.saturday:
        return 6;
      case AppStrings.sunday:
        return 7;
    }
    return 0;
  }
}

extension WeekDaysIntExtension on int {
  String fromStringtoInt() {
    switch (this) {
      case 1:
        return AppStrings.monday;
      case 2:
        return AppStrings.tuesday;
      case 3:
        return AppStrings.wensday;
      case 4:
        return AppStrings.thursday;
      case 5:
        return AppStrings.friday;
      case 6:
        return AppStrings.saturday;
      case 7:
        return AppStrings.sunday;
    }
    return AppStrings.sunday;
  }
}
