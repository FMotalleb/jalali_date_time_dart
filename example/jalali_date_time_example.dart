// ignore_for_file: avoid_print

import 'package:jalali_date_time/jalali_date_time.dart';

void main() {
  // Create a JalaliDateTime instance for the current date and time
  final jalaliNow = JalaliDateTime.now();

  // Access Jalali components
  final year = jalaliNow.year;
  final month = jalaliNow.month;
  final day = jalaliNow.day;
  print('today: $year-$month-$day');
  // Convert JalaliDateTime to DateTime
  final dateTime = jalaliNow.toDateTime();

  // Perform DateTime operations
  final tomorrow = dateTime.add(const Duration(days: 1));
  final tyear = tomorrow.year;
  final tmonth = tomorrow.month;
  final tday = tomorrow.day;
  print('tomorrow: $tyear-$tmonth-$tday');
  // Convert DateTime back to JalaliDateTime
  final jalaliTomorrow = JalaliDateTime.fromDateTime(tomorrow);

  // Compare JalaliDateTime objects
  if (jalaliTomorrow.isAfter(jalaliNow)) {
    // ignore: prefer_single_quotes
    print("Tomorrow is after today.");
  }
}
