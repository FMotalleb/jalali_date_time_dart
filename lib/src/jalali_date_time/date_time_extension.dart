import '../../jalali_date_time.dart';

/// Extension for converting a [DateTime] instance to a [JalaliDateTime]
/// instance.
extension DateTimeToJalali on DateTime {
  /// Converts the current [DateTime] instance to a [JalaliDateTime] instance.
  JalaliDateTime toJalali() => JalaliDateTime.fromDateTime(this);
}
