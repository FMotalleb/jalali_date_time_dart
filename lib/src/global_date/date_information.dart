import 'date_type.dart';

class GlobalDateInformation {
  GlobalDateInformation({
    required this.year,
    required this.month,
    required this.day,
    this.dateType = DateType.gregorian,
  });
  factory GlobalDateInformation.fromJalali(
    int year, [
    int month = 1,
    int day = 1,
  ]) =>
      GlobalDateInformation(
        year: year,
        month: month,
        day: day,
        dateType: DateType.jalali,
      );
  factory GlobalDateInformation.fromGregorian(
    int year, [
    int month = 1,
    int day = 1,
  ]) =>
      GlobalDateInformation(
        year: year,
        month: month,
        day: day,
        dateType: DateType.gregorian,
      );
  factory GlobalDateInformation.fromDateTime(DateTime dt) => GlobalDateInformation(
        year: dt.year,
        month: dt.month,
        day: dt.day,
      );

  factory GlobalDateInformation.gregorianToJalaliDate(GlobalDateInformation gregorian) {
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
    return GlobalDateInformation.fromJalali(jy, jm, jd);
  }

  factory GlobalDateInformation.jalaliToGregorian(GlobalDateInformation jalali) {
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
        ((jalali.month < 7) ? (jalali.month - 1) * 31 : ((jalali.month - 7) * 30) + 186);
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
      31
    ];
    for (gm = 0; gm < 13 && gd > salA[gm]; gm++) {
      gd -= salA[gm];
    }
    return GlobalDateInformation.fromGregorian(gy, gm, gd);
  }

  final int year;
  final int month;
  final int day;
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
}
