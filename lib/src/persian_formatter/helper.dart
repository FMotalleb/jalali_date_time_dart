import 'package:intl/intl.dart';

import '../../jalali_date_time.dart';

extension JalaliFormatter on JalaliDateTime {
  String toFormat(String format) => PersianDateTimeFormat(format).format(this);
}

extension DateTimeFormatter on DateTime {
  String toFormat(String format) => DateFormat(format).format(this);
}
