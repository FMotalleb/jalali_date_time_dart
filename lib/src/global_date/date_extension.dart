// ignore_for_file: comment_references

import 'date_information.dart';
import 'date_type.dart';

extension DateConverter on GlobalDateInformation {
  /// converts current instance to Jalali if its not
  /// if it is returns [this]
  GlobalDateInformation toJalaliDate() => dateType.mapper(
        this,
        DateType.jalali,
      );

  /// converts current instance to Gregorian if its not
  /// if it is returns [this]
  GlobalDateInformation toGregorianDate() => dateType.mapper(
        this,
        DateType.gregorian,
      );
}
