import 'package:alert/models/dosage_frequency.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/models/entities/pills_taking_entity.dart';
import 'package:alert/models/pill.dart';
import 'package:collection/collection.dart';

class PillsContainerExtractor {
  Map<String, List<Pill>> getContainers(
      List<PillEntity> pills, List<PillsTakingEntity> takings) {
    Map<String, List<Pill>> containers = {};

    pills.sort((a, b) => a.meal.compareOrder(b.meal));
    for (var pill in pills) {
      if (_isActive(pill)) {
        for (var hour in pill.hour) {
          if (containers[hour] == null) {
            containers[hour] = [];
          }
          var isTaken = _isTaken(pill, takings, hour);
          containers[hour]?.add(Pill.formEntity(pill, isTaken));
        }
      }
    }
    var sorted = Map.fromEntries(containers.entries.toList()
      ..sort((a, b) {
        var aParts = a.key.split(':').map(int.parse).toList();
        var bParts = b.key.split(':').map(int.parse).toList();

        if (aParts[0] != bParts[0]) {
          return aParts[0].compareTo(bParts[0]);
        }
        return aParts[1].compareTo(bParts[1]);
      }));

    return sorted;
  }

  bool _isTaken(PillEntity pill, List<PillsTakingEntity> takings, String hour) {
    var now = DateTime.now();
    var taking = takings.firstWhereOrNull((element) =>
        _isSameDay(element.date, now) &&
        element.hour == hour &&
        element.pillId == pill.id);
    if (taking != null) {
      return taking.isTaken;
    }
    return false;
  }

  bool _isSameDay(DateTime? date1, DateTime date2) {
    return date1?.year == date2.year &&
        date1?.month == date2.month &&
        date1?.day == date2.day;
  }

  bool _isActive(PillEntity pill) {
    var isActive = _handleDailyFrequency(pill);
    if (isActive) {
      switch (pill.frequency) {
        case DosageFrequency.daily:
          return true;
        case DosageFrequency.weekly:
          return _handleWeeklyFrequency(pill);
        case DosageFrequency.interval:
          return _handleIntervalFrequency(pill);
      }
    }
    return false;
  }

  bool _handleIntervalFrequency(PillEntity pill) {
    var freq = pill.intervalFrequencyValue;
    var start = pill.startDate;
    var stop = pill.stopDate;
    if (freq != null && start != null && stop != null) {
      var date = start;
      while (stop.isAfter(date)) {
        if (_isSameDay(date, DateTime.now())) {
          return true;
        }
        date = date.add(Duration(days: freq));
      }
    }

    return false;
  }

  bool _handleDailyFrequency(PillEntity pill) {
    var now = DateTime.now();
    var isAfterStartDate = (pill.startDate?.isBefore(now) ?? false) ||
        _isSameDay(pill.startDate, now);
    var isBeforeStopDate = (pill.stopDate?.isAfter(now) ?? false) ||
        _isSameDay(pill.stopDate, now);
    if (isAfterStartDate && isBeforeStopDate) {
      return true;
    }
    return false;
  }

  bool _handleWeeklyFrequency(PillEntity pill) {
    var nowDay = DateTime.now().weekday;
    return nowDay == pill.weeklyFrequencyValue;
  }
}
