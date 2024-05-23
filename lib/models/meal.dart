import 'package:alert/config/app_strings.dart';

enum Meal {
  before,
  during,
  after;

  static Meal fromString(String value) {
    switch (value) {
      case AppStrings.afterMeal:
        return Meal.after;
      case AppStrings.duringMeal:
        return Meal.during;
      case AppStrings.beforeMeal:
        return Meal.before;
      default:
        return Meal.after;
    }
  }

  int compareOrder(Meal other) {
    if (index == other.index) {
      return 0;
    } else if (index > other.index) {
      return -1;
    } else if (index < other.index) {
      return 1;
    }
    return 0;
  }
}

extension MealExtension on Meal {
  String toPolishString() {
    switch (this) {
      case Meal.after:
        return AppStrings.afterMeal;
      case Meal.during:
        return AppStrings.duringMeal;
      case Meal.before:
        return AppStrings.beforeMeal;
    }
  }
}
