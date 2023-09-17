import 'package:hemend_jalali/src/global_date/date_information.dart';

import '../global_date/date_extension.dart';
import '../global_date/date_type.dart';

/// JalaliDateTime is just a wrapper around DateTime provided by dart
///
/// this class uses GlobalDateInformation to represent Jalali Date
/// (year,month,day)
///
/// for time related methods (e.g. time & zone) uses DateTime directly
///
/// this class uses 4 internal allocations for year,month,day and
/// source DateTime
class JalaliDateTime extends GlobalDateInformation implements Comparable<JalaliDateTime> {
  JalaliDateTime._(
    this._source, {
    required super.year,
    required super.month,
    required super.day,
  }) : super(
          dateType: DateType.jalali,
        );
  factory JalaliDateTime.now() => JalaliDateTime.fromDateTime(DateTime.now());
  factory JalaliDateTime.fromDateTime(DateTime dt) {
    final jd = GlobalDateInformation.fromGregorian(
      dt.year,
      dt.month,
      dt.day,
    ).toJalaliDate();
    return JalaliDateTime._(
      dt,
      year: jd.year,
      month: jd.month,
      day: jd.day,
    );
  }
  factory JalaliDateTime.fromMillisecondsSinceEpoch(
    int millisecondsSinceEpoch, {
    bool isUtc = false,
  }) =>
      JalaliDateTime.fromDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          millisecondsSinceEpoch,
          isUtc: isUtc,
        ),
      );

  factory JalaliDateTime.fromMicrosecondsSinceEpoch(
    int microsecondsSinceEpoch, {
    bool isUtc = false,
  }) =>
      JalaliDateTime.fromDateTime(
        DateTime.fromMicrosecondsSinceEpoch(
          microsecondsSinceEpoch,
          isUtc: isUtc,
        ),
      );
  final DateTime _source;

  int get hour => _source.hour;

  int get microsecond => _source.microsecond;

  int get microsecondsSinceEpoch => _source.microsecondsSinceEpoch;

  int get millisecond => _source.millisecond;

  int get millisecondsSinceEpoch => _source.millisecondsSinceEpoch;
  int get minute => _source.minute;

  int get second => _source.second;

  int get weekday => _source.weekday;
  String get timeZoneName => _source.timeZoneName;

  Duration get timeZoneOffset => _source.timeZoneOffset;

  bool get isUtc => _source.isUtc;

  JalaliDateTime add(Duration duration) => JalaliDateTime.fromDateTime(
        _source.add(duration),
      );

  @override
  int compareTo(JalaliDateTime other) => _source.compareTo(other._source);

  Duration difference(JalaliDateTime other) => _source.difference(other._source);

  bool isAfter(JalaliDateTime other) => compareTo(other) > 0;

  bool isAtSameMomentAs(JalaliDateTime other) => compareTo(other) == 0;

  bool isBefore(JalaliDateTime other) => compareTo(other) < 0;

  JalaliDateTime subtract(Duration duration) => JalaliDateTime.fromDateTime(
        _source.subtract(duration),
      );

  String toIso8601String() => _source.toIso8601String();

  JalaliDateTime toLocal() => JalaliDateTime.fromDateTime(_source.toLocal());

  JalaliDateTime toUtc() => JalaliDateTime.fromDateTime(_source.toUtc());

  DateTime toDateTime() => _source;

  @override
  int get hashCode => _source.hashCode ^ year ^ month ^ day;
  @override
  bool operator ==(Object other) {
    if (other is! JalaliDateTime) {
      return false;
    }
    return _source == other._source;
  }

  @override
  String toString() {
    return 'JalaliDateTime($year,$month,$day,$hour,$minute,$second)';
  }
}
