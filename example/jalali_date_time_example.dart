// ignore_for_file: avoid_print, lines_longer_than_80_chars
import 'package:jalali_date_time/jalali_date_time.dart';

void main() {
  // Create a JalaliDateTime instance for the current date and time
  final jalaliNow = JalaliDateTime.now();

  // Access Jalali components
  final year = jalaliNow.year;
  final month = jalaliNow.month;
  final day = jalaliNow.day;
  print('today: $year-$month-$day'); // today: 1402-6-27
  // Convert JalaliDateTime to DateTime
  final dateTime = jalaliNow.getDateTime();

  // Perform DateTime operations
  final tomorrow = dateTime.add(const Duration(days: 1));

  // Convert DateTime back to JalaliDateTime
  final jalaliTomorrow = JalaliDateTime.fromDateTime(tomorrow);
  print(jalaliTomorrow == tomorrow.toJalali()); // true
  final tyear = jalaliTomorrow.year;
  final tmonth = jalaliTomorrow.month;
  final tday = jalaliTomorrow.day;
  print('tomorrow: $tyear-$tmonth-$tday'); // tomorrow: 1402-6-28
  // Compare JalaliDateTime objects
  if (jalaliTomorrow.isAfter(jalaliNow)) {
    print('Tomorrow is after today.'); // Tomorrow is after today.
  }
  print(DateTime(1986, 4, 26, 01, 23, 40).toJalali()); // 1365-02-06 01:23:40 +0330

  print(PersianDateTimeFormat.yMMMMEEEEd().format(jalaliTomorrow)); // سه‌شنبه, 1402-شهریور-28
}
