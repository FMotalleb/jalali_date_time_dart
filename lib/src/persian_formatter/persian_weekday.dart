/// The PersianWeekday enum represents the weekdays of the Persian (Solar Hijri)
/// calendar. Each weekday is associated with its Persian name,
/// corresponding weekday index (0-6), and corresponding Persian weekday index
/// (1-7).
enum PersianWeekday {
  shanbe(
    persianName: 'شنبه',
    persianWeekDayIndex: 1,
    weekDayIndex: 6,
  ),
  yekShanbe(
    persianName: 'یک‌شنبه',
    persianWeekDayIndex: 2,
    weekDayIndex: 7,
  ),
  doShanbe(
    persianName: 'دوشنبه',
    persianWeekDayIndex: 3,
    weekDayIndex: 1,
  ),
  seShanbe(
    persianName: 'سه‌شنبه',
    persianWeekDayIndex: 4,
    weekDayIndex: 2,
  ),
  chaharShanbe(
    persianName: 'چهارشنبه',
    persianWeekDayIndex: 5,
    weekDayIndex: 3,
  ),
  panjShanbe(
    persianName: 'پنج‌شنبه',
    persianWeekDayIndex: 6,
    weekDayIndex: 4,
  ),
  jome(
    persianName: 'جمعه',
    persianWeekDayIndex: 7,
    weekDayIndex: 5,
  ),
  ;

  const PersianWeekday({
    required this.persianName,
    required this.weekDayIndex,
    required this.persianWeekDayIndex,
  });

  /// Get weekday by original index (1-7) where (1=monday`doShanbe`)
  /// till (7=sunday`yekShanbe`)
  factory PersianWeekday.byWeekday(int weekDay) {
    assert(
      weekDay > 0 && weekDay <= 7,
      'Given index ($weekDay) is out of range (1-7)',
    );
    return values.firstWhere(
      (element) => element.weekDayIndex == weekDay,
    );
  }

  /// Get weekday by persian index (1-7) where (1=saturday`shanbe`)
  /// till (7=friday`jome`)
  factory PersianWeekday.byPersianWeekDay(int weekDay) {
    assert(
      weekDay > 0 && weekDay <= 7,
      'Given index ($weekDay) is out of range (1-7)',
    );
    return values.firstWhere(
      (element) => element.persianWeekDayIndex == weekDay,
    );
  }

  /// Name of the weekday (Fa)
  final String persianName;

  /// Original index (1-7) where (1=monday`doShanbe`) till (7=sunday`yekShanbe`)
  final int weekDayIndex;

  /// Persian index (1-7) where (1=saturday`shanbe`) till (7=friday`jome`)
  final int persianWeekDayIndex;
}
