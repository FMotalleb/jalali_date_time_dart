import '../../jalali_date_time.dart';

/// A function type that builds a [GlobalDateInformation] instance given year,
/// month, and day values.
typedef DateBuilder = GlobalDateInformation Function(
  int year,
  int month,
  int day,
);

/// A function type that receives a [date] and results in a [bool]
typedef ValidityCheck = bool Function(GlobalDateInformation date);

/// A function type that maps a [GlobalDateInformation] instance to a different
/// [DateType].
typedef DateMapper = GlobalDateInformation Function(
  GlobalDateInformation date,
  DateType target,
);

/// An enumeration representing different date types, including Jalali and
/// Gregorian.
enum DateType {
  /// Represents the Jalali calendar (https://en.wikipedia.org/wiki/Jalali_calendar).
  jalali(
    builder: GlobalDateInformation.fromJalali,
    mapper: _jalaliMapper,
    validityTest: _jalaliCheck,
  ),

  /// Represents the Gregorian calendar.
  gregorian(
    builder: GlobalDateInformation.fromGregorian,
    mapper: _gregorianMapper,
    validityTest: _gregorianCheck,
  ),
  ;

  const DateType({
    required this.builder,
    required this.mapper,
    required this.validityTest,
  });

  /// Create a [GlobalDateInformation] instance of this type with the given
  /// year, month, and day values.
  final DateBuilder builder;

  /// Map a [GlobalDateInformation] instance of this type to a target type.
  final DateMapper mapper;
  final ValidityCheck validityTest;
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

bool _gregorianCheck(GlobalDateInformation date) => //
    date.toJalaliDate().toGregorianDate() == date;
bool _jalaliCheck(GlobalDateInformation date) => //
    date.toGregorianDate().toJalaliDate() == date;
