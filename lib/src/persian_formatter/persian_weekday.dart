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
  factory PersianWeekday.byWeekday(int weekDay) {
    assert(
      weekDay > 0 && weekDay <= 7,
      'Given index ($weekDay) is out of range (1-7)',
    );
    return values.firstWhere(
      (element) => element.weekDayIndex == weekDay,
    );
  }
  factory PersianWeekday.byPersianWeekDay(int weekDay) {
    assert(
      weekDay > 0 && weekDay <= 7,
      'Given index ($weekDay) is out of range (1-7)',
    );
    return values.firstWhere(
      (element) => element.persianWeekDayIndex == weekDay,
    );
  }

  final String persianName;
  final int weekDayIndex;
  final int persianWeekDayIndex;
}
