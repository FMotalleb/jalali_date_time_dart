// ignore_for_file: lines_longer_than_80_chars

import 'package:meta/meta.dart';

import '../../jalali_date_time.dart';

/// Holds information of three integer values representing year, month, and day,
/// along with an enum value of type [DateType] indicating the type of
/// this date model.
@immutable
class GlobalDateInformation {
  /// Represents a date with year, month, and day values.
  ///
  /// The [year], [month], [day] and [dateType] parameters are required to create a
  /// [GlobalDateInformation] object.
  ///
  /// Example usage:
  /// ```dart
  /// final dateInfo = GlobalDateInformation(
  ///   year: 1400,
  ///   month: 9,
  ///   day: 18,
  ///   dateType: DateType.jalali,
  /// );
  /// ```
  const GlobalDateInformation({
    required this.year,
    required this.month,
    required this.day,
    required this.dateType,
  });

  /// Constructs a new [GlobalDateInformation] for the type [DateType.jalali].
  ///
  /// Requires a year value. Month and day values default to 1.
  ///
  /// Example usage:
  /// ```dart
  /// final dateInfo = GlobalDateInformation.fromJalali(1400);
  /// ```
  factory GlobalDateInformation.fromJalali(
    int year, [
    int month = 1,
    int day = 1,
  ]) {
    assert(
      month > 0 && month <= 12 && day > 0 && day <= 31,
      'given values are out of bounds (month: 0<$month<=12, day: 0<$day<=31)',
    );
    final globalDateInformation = GlobalDateInformation(
      year: year,
      month: month,
      day: day,
      dateType: DateType.jalali,
    );
    assert(
      globalDateInformation.isValid(),
      'Given date is not correct (maybe b.c. of leap years)',
    );
    return globalDateInformation;
  }

  /// Constructs a new [GlobalDateInformation] for the type [DateType.gregorian].
  ///
  /// Requires a year value. Month and day values default to 1.
  ///
  /// Example usage:
  /// ```dart
  /// final dateInfo = GlobalDateInformation.fromGregorian(2020);
  /// ```
  factory GlobalDateInformation.fromGregorian(
    int year, [
    int month = 1,
    int day = 1,
  ]) {
    assert(
      month > 0 && month <= 12 && day > 0 && day <= 31,
      'given values are out of bounds (month: 0<$month<=12, day: 0<$day<=31)',
    );
    final globalDateInformation = GlobalDateInformation(
      year: year,
      month: month,
      day: day,
      dateType: DateType.gregorian,
    );
    assert(
      globalDateInformation.isValid(),
      'Given date is not correct (maybe b.c. of leap years)',
    );
    return globalDateInformation;
  }

  /// Constructs a new [GlobalDateInformation] from a [DateTime] object.
  ///
  /// Example usage:
  /// ```dart
  /// final dateTime = DateTime(2023, 9, 18);
  /// final dateInfo = GlobalDateInformation.fromDateTime(dateTime);
  /// ```
  factory GlobalDateInformation.fromDateTime(DateTime dt) => //
      GlobalDateInformation.fromGregorian(
        dt.year,
        dt.month,
        dt.day,
      );

  /// Implementation of conversion from Gregorian to Jalali.
  ///
  /// Special thanks to `https://jdf.scr.ir/` for providing the conversion code.
  factory GlobalDateInformation.gregorianToJalaliDate(
    GlobalDateInformation gregorian,
  ) {
    int jm;
    int jd;
    final gdm = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    final gy2 = (gregorian.month > 2) ? (gregorian.year + 1) : gregorian.year;
    num days = 355666 +
        (365 * gregorian.year) +
        ((gy2 + 3) ~/ 4) -
        ((gy2 + 99) ~/ 100) +
        ((gy2 + 399) ~/ 400) +
        gregorian.day +
        gdm[gregorian.month - 1];
    var jy = -1595 + (33 * (days ~/ 12053));
    days %= 12053;
    jy += 4 * (days ~/ 1461);
    days %= 1461;
    if (days > 365) {
      jy += (days - 1) ~/ 365;
      days = (days - 1) % 365;
    }
    if (days < 186) {
      jm = 1 + (days ~/ 31);
      jd = (1 + (days % 31)).toInt();
    } else {
      jm = 7 + ((days - 186) ~/ 30);
      jd = (1 + ((days - 186) % 30)).toInt();
    }
    return GlobalDateInformation(
      year: jy,
      month: jm,
      day: jd,
      dateType: DateType.jalali,
    );
  }

  /// Implementation of conversion from Jalali to Gregorian
  ///
  /// Special thanks to `https://jdf.scr.ir/` for providing the conversion code.
  factory GlobalDateInformation.jalaliToGregorian(
    GlobalDateInformation jalali,
  ) {
    int gy;
    int gm;
    int gd;
    int days;
    final jy = jalali.year + 1595;
    days = -355668 +
        (365 * jy) +
        ((jy ~/ 33) * 8) +
        (((jy % 33) + 3) ~/ 4) +
        jalali.day +
        ((jalali.month < 7)
            ? //
            (jalali.month - 1) * 31
            : ((jalali.month - 7) * 30) + 186);
    gy = 400 * (days ~/ 146097);
    days %= 146097;
    if (days > 36524) {
      gy += 100 * (--days ~/ 36524);
      days %= 36524;
      if (days >= 365) {
        days++;
      }
    }
    gy += 4 * (days ~/ 1461);
    days %= 1461;
    if (days > 365) {
      gy += (days - 1) ~/ 365;
      days = (days - 1) % 365;
    }
    gd = days + 1;
    final salA = [
      0,
      31,
      if ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)) 29 else 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];
    for (gm = 0; gm < 13 && gd > salA[gm]; gm++) {
      gd -= salA[gm];
    }
    return GlobalDateInformation(
      year: gy,
      month: gm,
      day: gd,
      dateType: DateType.gregorian,
    );
  }

  /// Represents the [year] value
  final int year;

  /// Represents the [month] value within the [year].
  final int month;

  /// Represents the [day] value within the [month].
  final int day;

  /// Represents the type of date (e.g., Gregorian or Jalali) using [DateType].
  final DateType dateType;

  @override
  String toString() {
    final buffer = StringBuffer('DateInformation(')
      ..write(dateType.name)
      ..write(',')
      ..write(year.toString().padLeft(4, '0'))
      ..write('-')
      ..write(month.toString().padLeft(2, '0'))
      ..write('-')
      ..write(day.toString().padLeft(2, '0'))
      ..write(')');
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is GlobalDateInformation &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.dateType == dateType;
  }

  @override
  int get hashCode {
    return year.hashCode ^ //
        month.hashCode ^
        day.hashCode ^
        dateType.hashCode << 30;
  }
}
