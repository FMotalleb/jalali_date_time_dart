import 'date_information.dart';
import 'date_type.dart';

extension DateConverter on GlobalDateInformation {
  GlobalDateInformation toJalaliDate() => dateType.mapper(
        this,
        DateType.jalali,
      );
  GlobalDateInformation toGregorianDate() => dateType.mapper(
        this,
        DateType.gregorian,
      );
}
