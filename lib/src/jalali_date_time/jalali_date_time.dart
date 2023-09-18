import 'package:meta/meta.dart';

import '../../global_date_time.dart';

/// JalaliDateTime is just a wrapper around DateTime provided by dart
///
/// this class uses GlobalDateInformation to represent Jalali Date
/// (year,month,day)
///
/// for time related methods (e.g. time & zone) uses DateTime directly
///
/// this class uses 4 internal allocations for year,month,day and
/// source DateTime
@immutable
final class JalaliDateTime extends GlobalDateInformation //
    implements
        Comparable<JalaliDateTime> {
  /// Constructs a [JalaliDateTime] instance specified in the local time zone.
  ///
  /// For example,
  /// to create a `JalaliDateTime` object representing the
  /// 28 khordad 1400
  ///
  /// ```dart
  /// final theDay = JalaliDateTime(1400,3,28,9);
  /// ```
  factory JalaliDateTime(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  ]) {
    final jInstance = GlobalDateInformation.fromJalali(year, month, day);
    final gInstance = jInstance.toGregorianDate();
    return JalaliDateTime._(
      DateTime(
        gInstance.year,
        gInstance.month,
        gInstance.day,
        hour,
        minute,
        seconds,
        milliseconds,
        microseconds,
      ),
      year: year,
      month: month,
      day: day,
    );
  }

  /// Constructs a [JalaliDateTime] instance specified in the UTC time zone.
  ///
  /// For example,
  /// to create a `JalaliDateTime` object representing the
  /// 28 khordad 1400
  ///
  /// ```dart
  /// final theDay = JalaliDateTime.utc(1400,3,28);
  /// ```
  ///
  /// When dealing with dates or historic events, preferably use UTC DateTimes,
  /// since they are unaffected by daylight-saving changes and are unaffected
  /// by the local timezone.
  factory JalaliDateTime.utc(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  ]) {
    final jInstance = GlobalDateInformation.fromJalali(year, month, day);
    final gInstance = jInstance.toGregorianDate();
    return JalaliDateTime._(
      DateTime.utc(
        gInstance.year,
        gInstance.month,
        gInstance.day,
        hour,
        minute,
        seconds,
        milliseconds,
        microseconds,
      ),
      year: year,
      month: month,
      day: day,
    );
  }

  /// internal constructor
  const JalaliDateTime._(
    this._source, {
    required super.year,
    required super.month,
    required super.day,
  }) : super(
          dateType: DateType.jalali,
        );

  /// Constructs a [JalaliDateTime] instance with current date and time in the
  /// local time zone.
  ///
  /// ```dart
  /// final now = JalaliDateTime.now();
  /// ```
  factory JalaliDateTime.now() => JalaliDateTime.fromDateTime(DateTime.now());

  /// Constructs a [JalaliDateTime] with the current UTC date and time.
  ///
  ///
  /// ```dart
  /// final mark = JalaliDateTime.timestamp();
  /// ```
  factory JalaliDateTime.timestamp() => JalaliDateTime.fromDateTime(
        DateTime.timestamp(),
      );

  /// Constructs a [JalaliDateTime] from given [DateTime]
  ///
  /// this factory converts [DateTime] to [JalaliDateTime]
  ///
  ///
  /// ```dart
  /// final current = JalaliDateTime.fromDateTime(DateTime.now());
  /// ```
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

  /// Constructs a new [JalaliDateTime] instance
  /// with the given [millisecondsSinceEpoch].
  ///
  /// If [isUtc] is false, then the date is in the local time zone.
  ///
  /// This method uses [DateTime.fromMillisecondsSinceEpoch] internally
  ///
  /// The constructed [JalaliDateTime] represents
  /// 1348-10-11T00:00:00Z + [millisecondsSinceEpoch] us in the given
  /// time zone (local or UTC).
  /// ```dart
  /// final newYearsEve = JalaliDateTime.fromMillisecondsSinceEpoch(
  ///       1640901600000, // (2021-12-31 19:30:00.000Z)
  ///       isUtc:true,
  ///     );
  /// print(newYearsEve); // JalaliDateTime(1400,10,9,22,0,0)
  /// ```
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

  /// Constructs a new [JalaliDateTime] instance
  /// with the given [microsecondsSinceEpoch].
  ///
  /// If [isUtc] is false, then the date is in the local time zone.
  ///
  /// This method uses [DateTime.fromMicrosecondsSinceEpoch] internally
  ///
  /// The constructed [JalaliDateTime] represents
  /// 1348-10-11T00:00:00Z + [microsecondsSinceEpoch] us in the given
  /// time zone (local or UTC).
  /// ```dart
  /// final newYearsEve = JalaliDateTime.fromMicrosecondsSinceEpoch(
  ///       1640901600000000, // (2021-12-31 19:30:00.000Z)
  ///       isUtc:true,
  ///     );
  /// print(newYearsEve); // JalaliDateTime(1400,10,9,22,0,0)
  /// ```
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

  /// hour of [day]
  int get hour => _source.hour;

  /// microsecond of [second]
  int get microsecond => _source.microsecond;

  /// The number of microseconds since
  /// the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
  ///
  /// This value is independent of the time zone.
  ///
  /// This value is at most
  /// 8,640,000,000,000,000,000us (100,000,000 days) from the Unix epoch.
  /// In other words: `microsecondsSinceEpoch.abs() <= 8640000000000000000`.
  ///
  /// Note that this value does not fit into 53 bits (the size of a IEEE double)
  /// A JavaScript number is not able to hold this value.
  int get microsecondsSinceEpoch => _source.microsecondsSinceEpoch;

  /// The millisecond `[0...999]`.
  ///
  /// ```dart
  /// final date = JalaliDateTime.fromDateTime(
  ///     DateTime.parse('1970-01-01 05:01:01.234567Z'),
  ///   );
  /// print(date.millisecond); // 234
  /// ```
  int get millisecond => _source.millisecond;

  /// The number of milliseconds since
  /// the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
  ///
  /// This value is independent of the time zone.
  ///
  /// This value is at most
  /// 8,640,000,000,000,000ms (100,000,000 days) from the Unix epoch.
  /// In other words: `millisecondsSinceEpoch.abs() <= 8640000000000000`.
  int get millisecondsSinceEpoch => _source.millisecondsSinceEpoch;

  /// The minute `[0...59]`.
  int get minute => _source.minute;

  /// The second `[0...59]`.
  int get second => _source.second;

  /// **Caution**: This is not jalali week day
  ///
  /// The day of the week [DateTime.monday]..[DateTime.sunday].
  ///
  /// In accordance with ISO 8601
  /// a week starts with Monday, which has the value 1.
  ///
  /// ```dart
  /// final moonLanding = JalaliDateTime.fromDateTime(
  ///     DateTime.parse('1969-07-20 20:18:04Z'),
  ///   );
  /// print(moonLanding.weekday); // 7
  /// assert(moonLanding.weekday == DateTime.sunday);
  /// ```
  int get weekday => _source.weekday;

  /// The time zone name.
  ///
  /// This value is provided by the operating system and may be an
  /// abbreviation or a full name.
  ///
  /// In the browser or on Unix-like systems commonly returns abbreviations,
  /// such as "CET" or "CEST". On Windows returns the full name, for example
  /// "Pacific Standard Time".
  String get timeZoneName => _source.timeZoneName;

  /// The time zone offset, which
  /// is the difference between local time and UTC.
  ///
  /// The offset is positive for time zones east of UTC.
  ///
  /// Note, that JavaScript, Python and C return the difference between UTC and
  /// local time. Java, C# and Ruby return the difference between local time and
  /// UTC.
  ///
  /// For example, using local time in Tehran, Iran:
  /// ```dart
  /// final dateUS = JalaliDateTime.fromDateTime(
  ///   DateTime.parse('2021-11-01 20:18:04Z'),
  /// ).toLocal();
  /// print(dateUS); // JalaliDateTime(1400,8,10,23,48,4)
  /// print(dateUS.timeZoneName); // +0330 || Asia/Tehran
  /// print(dateUS.timeZoneOffset.inHours); // 3
  /// print(dateUS.timeZoneOffset.inMinutes); // 210
  /// ```
  Duration get timeZoneOffset => _source.timeZoneOffset;

  /// True if this [JalaliDateTime] is set to UTC time.
  ///
  /// ```dart
  /// final dDay = JalaliDateTime.utc(1944, 6, 6);
  /// print(dDay.isUtc); // true
  ///
  /// final local = JalaliDateTime(1944, 6, 6);
  /// print(local.isUtc); // false
  /// ```
  bool get isUtc => _source.isUtc;

  /// Returns a new [JalaliDateTime] instance with [duration] added to [this].
  ///
  /// ```dart
  /// final today = JalaliDateTime.now();
  /// final fiftyDaysFromNow = today.add(const Duration(days: 50));
  /// ```
  ///
  /// Notice that the duration being added is actually 50 * 24 * 60 * 60
  /// seconds. If the resulting `JalaliDateTime` has a different daylight
  /// saving offset than `this`, then the result won't have the same
  /// time-of-day as `this`, and may not even hit the calendar date 50 days
  /// later.
  ///
  /// Be careful when working with dates in local time.
  JalaliDateTime add(Duration duration) => JalaliDateTime.fromDateTime(
        _source.add(duration),
      );

  /// Compares this JalaliDateTime object to [other],
  /// returning zero if the values are equal.
  ///
  /// A [compareTo] function returns:
  ///  * a negative value if this JalaliDateTime [isBefore] [other].
  ///  * `0` if this DateTime [isAtSameMomentAs] [other], and
  ///  * a positive value otherwise (when this JalaliDateTime [isAfter] [other])
  ///
  /// ```dart
  /// final now = JalaliDateTime.now();
  /// final future = now.add(const Duration(days: 2));
  /// final past = now.subtract(const Duration(days: 2));
  /// final newDate = now.toUtc();
  ///
  /// print(now.compareTo(future)); // -1
  /// print(now.compareTo(past)); // 1
  /// print(now.compareTo(newDate)); // 0
  /// ```
  @override
  int compareTo(JalaliDateTime other) => _source.compareTo(other._source);

  /// Returns a [Duration] with the difference when subtracting [other] from
  /// [this].
  ///
  /// The returned [Duration] will be negative if [other] occurs after [this].
  ///
  /// ```dart
  /// final berlinWallFell = JalaliDateTime.fromDateTime(
  ///     DateTime.utc(1989, DateTime.november, 9),
  ///   );
  /// final dDay = JalaliDateTime.fromDateTime(
  ///     DateTime.utc(1944, DateTime.june, 6),
  ///   );
  ///
  /// final difference = berlinWallFell.difference(dDay);
  /// print(difference.inDays); // 16592
  /// ```
  ///
  /// The difference is measured in seconds and fractions of seconds.
  /// The difference above counts the number of fractional seconds between
  /// midnight at the beginning of those dates.
  /// If the dates above had been in local time, not UTC, then the difference
  /// between two midnights may not be a multiple of 24 hours due to daylight
  /// saving differences.
  ///
  /// For example, in Australia, similar code using local time instead of UTC:
  ///
  /// ```dart
  /// final berlinWallFell = JalaliDateTime.fromDateTime(
  ///     DateTime(1989, DateTime.november, 9),
  ///   );
  /// final dDay = JalaliDateTime.fromDateTime(
  ///     DateTime(1944, DateTime.june, 6),
  ///   );
  /// final difference = berlinWallFell.difference(dDay);
  /// print(difference.inDays); // 16591
  /// assert(difference.inDays == 16592);
  /// ```
  /// will fail because the difference is actually 16591 days and 23 hours, and
  /// [Duration.inDays] only returns the number of whole days.
  Duration difference(JalaliDateTime other) => _source.difference(
        other._source,
      );

  /// Returns true if [this] occurs after [other].
  ///
  /// The comparison is independent
  /// of whether the time is in UTC or in the local time zone.
  ///
  /// ```dart
  /// final now = JalaliDateTime.now();
  /// final later = now.add(const Duration(seconds: 5));
  /// print(later.isAfter(now)); // true
  /// print(!now.isBefore(now)); // true
  ///
  /// // This relation stays the same, even when changing timezones.
  /// print(later.isAfter(now.toUtc())); // true
  /// print(later.toUtc().isAfter(now)); // true
  ///
  /// print(!now.toUtc().isAfter(now)); // true
  /// print(!now.isAfter(now.toUtc())); // true
  /// ```
  bool isAfter(JalaliDateTime other) => _source.isAfter(other._source);

  /// Returns true if [this] occurs at the same moment as [other].
  ///
  /// The comparison is independent of whether the time is in UTC or in the
  /// local time zone.
  ///
  /// ```dart
  /// final now = JalaliDateTime.now();
  /// final later = now.add(const Duration(seconds: 5));
  /// print(!later.isAtSameMomentAs(now)); // true
  /// print(now.isAtSameMomentAs(now)); // true
  ///
  /// // This relation stays the same, even when changing timezones.
  /// print(!later.isAtSameMomentAs(now.toUtc())); // true
  /// print(!later.toUtc().isAtSameMomentAs(now)); // true
  ///
  /// print(now.toUtc().isAtSameMomentAs(now)); // true
  /// print(now.isAtSameMomentAs(now.toUtc())); // true
  /// ```
  bool isAtSameMomentAs(JalaliDateTime other) => //
      _source.isAtSameMomentAs(_source);

  /// Returns true if [this] occurs before [other].
  ///
  /// The comparison is independent
  /// of whether the time is in UTC or in the local time zone.
  ///
  /// ```dart
  /// final now = JalaliDateTime.now();
  /// final earlier = now.subtract(const Duration(seconds: 5));
  /// print(earlier.isBefore(now)); // true
  /// print(!now.isBefore(now)); // true
  ///
  /// // This relation stays the same, even when changing timezones.
  /// print(earlier.isBefore(now.toUtc())); // true
  /// print(earlier.toUtc().isBefore(now)); // true
  ///
  /// print(!now.toUtc().isBefore(now)); // true
  /// print(!now.isBefore(now.toUtc())); // true
  /// ```
  bool isBefore(JalaliDateTime other) => _source.isBefore(other._source);

  /// Returns a new [JalaliDateTime] instance with [duration] subtracted from
  /// [this].
  ///
  /// ```dart
  /// final today = JalaliDateTime.now();
  /// final fiftyDaysAgo = today.subtract(const Duration(days: 50));
  /// ```
  ///
  /// Notice that the duration being subtracted is actually 50 * 24 * 60 * 60
  /// seconds. If the resulting `JalaliDateTime` has a different daylight saving
  /// offset than `this`, then the result won't have the same time-of-day as
  /// `this`, and may not even hit the calendar date 50 days earlier.
  ///
  /// Be careful when working with dates in local time.
  JalaliDateTime subtract(Duration duration) => JalaliDateTime.fromDateTime(
        _source.subtract(duration),
      );

  /// **Caution**: As its iso method the result will be in gregorian
  ///
  /// Returns an ISO-8601 full-precision extended format representation.
  ///
  /// The format is `yyyy-MM-ddTHH:mm:ss.mmmuuuZ` for UTC time,
  /// and `yyyy-MM-ddTHH:mm:ss.mmmuuu` (no trailing "Z") for local/non-UTC time,
  /// where:
  ///
  /// * `yyyy` is a, possibly negative, four digit representation of the year,
  ///   if the year is in the range -9999 to 9999,
  ///   otherwise it is a signed six digit representation of the year.
  /// * `MM` is the month in the range 01 to 12,
  /// * `dd` is the day of the month in the range 01 to 31,
  /// * `HH` are hours in the range 00 to 23,
  /// * `mm` are minutes in the range 00 to 59,
  /// * `ss` are seconds in the range 00 to 59 (no leap seconds),
  /// * `mmm` are milliseconds in the range 000 to 999, and
  /// * `uuu` are microseconds in the range 001 to 999. If [microsecond] equals
  ///   0, then this part is omitted.
  ///
  /// The resulting string can be parsed back using [parse].
  /// ```dart
  /// final moonLanding = JalaliDateTime(1348,4,29,20,18,4);
  /// final isoDate = moonLanding.toIso8601String();
  /// print(isoDate); // 1969-07-20T20:18:04.000Z
  /// ```
  String toIso8601String() => _source.toIso8601String();

  /// Returns this JalaliDateTime value in the local time zone.
  ///
  /// Returns [this] if it is already in the local time zone.
  /// Otherwise this method is equivalent to:
  ///
  /// ```dart template:expression
  /// JalaliDateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch,
  ///                                     isUtc: false)
  /// ```
  JalaliDateTime toLocal() => JalaliDateTime.fromDateTime(_source.toLocal());

  /// Returns this JalaliDateTime value in the UTC time zone.
  ///
  /// Returns [this] if it is already in UTC.
  /// Otherwise this method is equivalent to:
  ///
  /// ```dart template:expression
  /// JalaliDateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch,
  ///                                     isUtc: true)
  /// ```
  JalaliDateTime toUtc() => JalaliDateTime.fromDateTime(_source.toUtc());

  /// Returns this [JalaliDateTime] value in form of dart's [DateTime].
  ///
  /// ```dart template:expression
  /// JalaliDateTime.now().toDateTime()
  /// ```
  DateTime toDateTime() => _source;

  @override
  int get hashCode => _source.hashCode ^ year ^ month ^ day;

  /// Returns true if [other] is a [JalaliDateTime] at the same moment and in
  /// the same time zone (UTC or local).
  ///
  /// ```dart
  /// final theDayUtc = JalaliDateTime.utc(1388, 3, 22);
  /// final theDayLocal = theDayUtc.toLocal();
  ///
  /// // These two dates are at the same moment, but are in different zones.
  /// print(theDayLocal == theDayUtc); // false
  /// print(theDayLocal.isAtSameMomentAs(theDayUtc)); // true
  /// ```
  ///
  /// See [isAtSameMomentAs] for a comparison that compares moments in time
  /// independently of their zones.
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
