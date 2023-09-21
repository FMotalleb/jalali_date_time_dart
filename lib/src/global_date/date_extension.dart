// ignore_for_file: comment_references

import 'date_information.dart';
import 'date_type.dart';

/// Extension for converting a [GlobalDateInformation] instance between
/// different formats
extension DateConverter on GlobalDateInformation {
  /// Converts the current instance to Jalali if it's not already Jalali.
  /// Returns [this] if it's already in Jalali format.
  GlobalDateInformation toJalaliDate() => dateType.mapper(
        this,
        DateType.jalali,
      );

  /// Converts the current instance to Gregorian if it's not already Gregorian.
  /// Returns [this] if it's already in Gregorian format.
  GlobalDateInformation toGregorianDate() => dateType.mapper(
        this,
        DateType.gregorian,
      );

  /// checks if this instance is in correct bound
  bool isValid() => dateType.validityTest(this);
}
