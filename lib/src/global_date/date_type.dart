import 'date_information.dart';

typedef DateBuilder = GlobalDateInformation Function(
  int year,
  int month,
  int day,
);
typedef DateMapper = GlobalDateInformation Function(
  GlobalDateInformation date,
  DateType target,
);

/// Jalali calendar `https://en.wikipedia.org/wiki/Jalali_calendar`
enum DateType {
  jalali(
    builder: GlobalDateInformation.fromJalali,
    mapper: _jalaliMapper,
  ),
  gregorian(
    builder: GlobalDateInformation.fromGregorian,
    mapper: _gregorianMapper,
  ),
  ;

  const DateType({
    required this.builder,
    required this.mapper,
  });
  final DateBuilder builder;
  final DateMapper mapper;
}

GlobalDateInformation _jalaliMapper(
  GlobalDateInformation date,
  DateType target,
) {
  assert(
    date.dateType == DateType.jalali,
    'conversion from jalali applied on none jalali date',
  );
  return switch (target) {
    DateType.jalali => date,
    DateType.gregorian => GlobalDateInformation.jalaliToGregorian(date),
  };
}

GlobalDateInformation _gregorianMapper(
  GlobalDateInformation date,
  DateType target,
) {
  assert(
    date.dateType == DateType.gregorian,
    'conversion from gregorian applied on none gregorian date',
  );
  return switch (target) {
    DateType.jalali => GlobalDateInformation.gregorianToJalaliDate(date),
    DateType.gregorian => date,
  };
}
