// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

import '../../jalali_date_time.dart';

/// ICU Name                   Skeleton
/// --------                   --------
/// DAY                          d
/// ABBR_WEEKDAY                 E // Sunday
/// WEEKDAY                      EEEE
/// ABBR_STANDALONE_MONTH        LLL
/// STANDALONE_MONTH             LLLL
/// NUM_MONTH                    M
/// NUM_MONTH_DAY                Md
/// NUM_MONTH_WEEKDAY_DAY        MEd
/// ABBR_MONTH                   MMM
/// ABBR_MONTH_DAY               MMMd
/// ABBR_MONTH_WEEKDAY_DAY       MMMEd
/// MONTH                        MMMM
/// MONTH_DAY                    MMMMd
/// MONTH_WEEKDAY_DAY            MMMMEEEEd
/// ABBR_QUARTER                 QQQ
/// QUARTER                      QQQQ
/// YEAR                         y
/// YEAR_NUM_MONTH               yM
/// YEAR_NUM_MONTH_DAY           yMd
/// YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
/// YEAR_ABBR_MONTH              yMMM
/// YEAR_ABBR_MONTH_DAY          yMMMd
/// YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
/// YEAR_MONTH                   yMMMM
/// YEAR_MONTH_DAY               yMMMMd
/// YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
/// YEAR_ABBR_QUARTER            yQQQ
/// YEAR_QUARTER                 yQQQQ
/// HOUR24                       H
/// HOUR24_MINUTE                Hm
/// HOUR24_MINUTE_SECOND         Hms
/// HOUR                         j
/// HOUR_MINUTE                  jm
/// HOUR_MINUTE_SECOND           jms
/// HOUR_MINUTE_GENERIC_TZ       jmv   (not yet implemented)
/// HOUR_MINUTE_TZ               jmz   (not yet implemented)
/// HOUR_GENERIC_TZ              jv    (not yet implemented)
/// HOUR_TZ                      jz    (not yet implemented)
/// MINUTE                       m
/// MINUTE_SECOND                ms
/// SECOND                       s

/// {@template formatter}
/// The [PersianDateFormat] class is a utility class designed to format dates
/// and times using the Persian (Jalali) calendar system. It provides various
/// formatting options for date and time values, allowing you to customize how
/// date and time information is displayed.
/// {@endtemplate}
class PersianDateFormat {
  /// By using this constructor, you can initialize the formatter with a raw
  /// pattern.
  ///
  /// Keep in mind that if you want to initialize your pattern using named
  /// constructors and then use `add_*` methods to update the pattern, it's
  /// better to directly use this constructor to boost performance.
  ///
  /// {@macro formatter}
  PersianDateFormat([
    String initialPattern = '',
  ]) : _pattern = _patternParser(initialPattern).toList(growable: false);
  const PersianDateFormat._(this._pattern);

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.d() : this('d');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.E() : this('E');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.EEEE() : this('EEEE');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.LLL() : this('LLL');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.LLLL() : this('LLLL');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.M() : this('M');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.Md() : this('Md');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MEd() : this('MEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMM() : this('MMM');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMMd() : this('MMMd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMMEd() : this('MMMEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMMM() : this('MMMM');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMMMd() : this('MMMMd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.MMMMEEEEd() : this('MMMMEEEEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.QQQ() : this('QQQ');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.QQQQ() : this('QQQQ');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.y() : this('y');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yM() : this('yM');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMd() : this('yMd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMEd() : this('yMEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMM() : this('yMMM');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMMd() : this('yMMMd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMMEd() : this('yMMMEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMMM() : this('yMMMM');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMMMd() : this('yMMMMd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yMMMMEEEEd() : this('yMMMMEEEEd');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yQQQ() : this('yQQQ');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.yQQQQ() : this('yQQQQ');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.H() : this('H');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.Hm() : this('Hm');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.Hms() : this('Hms');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.j() : this('j');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.jm() : this('jm');

  /// Create a PersianDateFormat instance with a predefined pattern
  PersianDateFormat.jms() : this('jms');

  /// Get current pattern in string format
  String get pattern => _pattern.join();

  /// Get current pattern in list format (tokenized)
  ///
  /// in this form you may receive `['H','m','s']`
  List<String> get patternList => _pattern.toList(growable: true);

  static List<String> _patternParser(
    String pattern, [
    String? lastToken,
  ]) {
    if (pattern.isEmpty) {
      return [
        if (lastToken != null) lastToken,
      ];
    }
    var currentMatch = '';
    for (final i in _possiblePatterns) {
      if (pattern.startsWith(i)) {
        if (currentMatch.length < i.length) {
          currentMatch = i;
        }
      }
    }
    if (currentMatch.isEmpty) {
      final char = '${lastToken ?? ''}${pattern[0]}';
      final newFormat = pattern.replaceRange(0, 1, '');

      return _patternParser(newFormat, char);
    }
    final newFormat = pattern.replaceRange(0, currentMatch.length, '');
    return [
      if (lastToken != null) lastToken,
      currentMatch,
      ..._patternParser(newFormat),
    ];
  }

  final List<String> _pattern;

  /// Adds new pattern after current pattern and returns new instance
  /// that has '[pattern]+[additionalPattern]' as its pattern
  PersianDateFormat addPattern(String additionalPattern) => //
      PersianDateFormat('$pattern$additionalPattern');

  /// Apply the format on [dateTime] and return result as string
  String format(JalaliDateTime dateTime) => //
      tokenizedFormat(dateTime).join();

  /// Returns tokenized format of the given [dateTime]
  ///
  /// ***Useful for debug***
  List<String> tokenizedFormat(JalaliDateTime dateTime) => _internalFormatter(
        dateTime,
        patternList,
      );
  static List<String> _internalFormatter(
    JalaliDateTime dateTime,
    List<String> formatList,
  ) {
    if (formatList.isEmpty) {
      return [];
    }
    final current = formatList.removeLast();
    final formatter = _getFormatterFor(current);
    return [
      ..._internalFormatter(dateTime, formatList),
      formatter(dateTime),
    ];
  }

  /// Apply the format on [dateTime] and return result as string
  String call(JalaliDateTime dateTime) => format(dateTime);

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_d() => addPattern('d');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_E() => addPattern('E');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_EEEE() => addPattern('EEEE');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_LLL() => addPattern('LLL');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_LLLL() => addPattern('LLLL');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_M() => addPattern('M');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_m() => addPattern('m');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_Md() => addPattern('Md');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MEd() => addPattern('MEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMM() => addPattern('MMM');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMMd() => addPattern('MMMd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMMEd() => addPattern('MMMEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMMM() => addPattern('MMMM');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMMMd() => addPattern('MMMMd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_MMMMEEEEd() => addPattern('MMMMEEEEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_QQQ() => addPattern('QQQ');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_QQQQ() => addPattern('QQQQ');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_y() => addPattern('y');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yM() => addPattern('yM');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMd() => addPattern('yMd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMEd() => addPattern('yMEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMM() => addPattern('yMMM');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMMd() => addPattern('yMMMd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMMEd() => addPattern('yMMMEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMMM() => addPattern('yMMMM');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMMMd() => addPattern('yMMMMd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yMMMMEEEEd() => addPattern('yMMMMEEEEd');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yQQQ() => addPattern('yQQQ');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_yQQQQ() => addPattern('yQQQQ');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_H() => addPattern('H');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_Hm() => addPattern('Hm');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_Hms() => addPattern('Hms');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_j() => addPattern('j');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_jm() => addPattern('jm');

  /// Add a predefined pattern to current [pattern] and returns new instance
  PersianDateFormat add_jms() => addPattern('jms');

  /// Refreshes the tokenized pattern of the formatter.
  ///
  /// **Unused due to change in the [addPattern] method!**
  ///
  /// The [refresh] method updates the internal formatting pattern to match
  /// the current state of the formatter. This is useful when you want to ensure
  /// that the formatter uses a specific pattern consistently, especially in
  /// performance-critical scenarios such as loops.
  ///
  /// Usage:
  /// ```dart
  /// final formatter = PersianDateFormat.H().add_m();
  /// // The real pattern is 'Hm'
  ///
  /// // Get the current pattern
  /// final currentPattern = formatter.pattern;
  /// print(currentPattern); // Output: 'Hm'
  ///
  /// // Get the pattern as a list
  /// final patternList = formatter.patternList;
  /// print(patternList); // Output: ['H', 'm']
  ///
  /// // Refresh the formatter to use 'Hm' as the pattern
  /// final newFormatter = formatter.refresh();
  ///
  /// // Now the pattern is 'Hm'
  /// print(newFormatter.pattern); // Output: 'Hm'
  /// print(newFormatter.patternList); // Output: `['Hm']`
  /// ```
  ///
  /// Returns a new `PersianDateFormat` instance with the updated pattern.
  PersianDateFormat refresh() => PersianDateFormat(pattern);

  static String Function(JalaliDateTime) _getFormatterFor(String format) {
    return switch (format) {
      'd' => (dt) => dt.day.toString(),
      'E' => (dt) => dt.jalaliWeekday.persianName,
      'EEEE' => (dt) => dt.jalaliWeekday.persianName,
      'LLL' => (dt) => dt.persianMonth.persianName,
      'LLLL' => (dt) => dt.persianMonth.persianName,
      'MMM' => (dt) => dt.persianMonth.persianName,
      'MMMM' => (dt) => dt.persianMonth.persianName,
      'M' => (dt) => dt.month.toString(),
      'MM' => (dt) => dt.month.toString().padLeft(2, '0'),
      'dd' => (dt) => dt.day.toString().padLeft(2, '0'),
      'Md' => const PersianDateFormat._(['M', '/', 'd']).format,
      'MEd' => const PersianDateFormat._(['E', ', ', 'Md']).format,
      'MMMd' => const PersianDateFormat._(['MMM', ' ', 'd']).format,
      'MMMMd' => const PersianDateFormat._(['MMM', ' ', 'd']).format,
      'MMMEd' => const PersianDateFormat._(['E', ', ', 'MMMd']).format,
      'MMMMEEEEd' => const PersianDateFormat._(['E', ', ', 'MMMd']).format,
      'QQQ' => (dt) => 'فصل ${dt.month ~/ 4}',
      'QQQQ' => const PersianDateFormat._(['QQQ']).format,
      'y' => (dt) => dt.year.toString(),
      'yM' => const PersianDateFormat._(['y', '-', 'MM']).format,
      'yMd' => const PersianDateFormat._(['y', '-', 'MM', '-', 'dd']).format,
      'yMEd' => const PersianDateFormat._(['E', ', ', 'yMd']).format,
      'yMMM' => const PersianDateFormat._(['y', '-', 'MMM']).format,
      'yMMMd' => const PersianDateFormat._(['yMMM', '-', 'dd']).format,
      'yMMMEd' => const PersianDateFormat._(['E', ', ', 'yMMMd']).format,
      'yMMMM' => const PersianDateFormat._(['y', '-', 'MMMM']).format,
      'yMMMMd' => const PersianDateFormat._(['yMMMM', '-', 'dd']).format,
      'yMMMMEEEEd' => const PersianDateFormat._(['E', ', ', 'yMMMMd']).format,
      'H' => (dt) => DateFormat.H().format(dt.getDateTime()),
      'm' => (dt) => DateFormat.m().format(dt.getDateTime()),
      's' => (dt) => DateFormat.s().format(dt.getDateTime()),
      'Hm' => (dt) => DateFormat.Hm().format(dt.getDateTime()),
      'Hms' => (dt) => DateFormat.Hms().format(dt.getDateTime()),
      'j' => (dt) => DateFormat.j().format(dt.getDateTime()),
      'jm' => (dt) => DateFormat.jm().format(dt.getDateTime()),
      'jms' => (dt) => DateFormat.jms().format(dt.getDateTime()),
      'jmv' => (dt) => DateFormat.jmv().format(dt.getDateTime()),
      'jmz' => (dt) => DateFormat.jmz().format(dt.getDateTime()),
      'jv' => (dt) => DateFormat.jv().format(dt.getDateTime()),
      'jz' => (dt) => DateFormat.jz().format(dt.getDateTime()),
      'ms' => (dt) => DateFormat.ms().format(dt.getDateTime()),
      _ => (_) => format,
    };
  }

  static const _possiblePatterns = [
    'd',
    'E',
    'EEEE',
    'LLL',
    'LLLL',
    'MMM',
    'MMMM',
    'M',
    'MM',
    'dd',
    'Md',
    'MEd',
    'MMMd',
    'MMMMd',
    'MMMEd',
    'MMMMEEEEd',
    'QQQ',
    'QQQQ',
    'y',
    'yM',
    'yMd',
    'yMEd',
    'yMMM',
    'yMMMd',
    'yMMMEd',
    'yMMMM',
    'yMMMMd',
    'yMMMMEEEEd',
    'H',
    'm',
    's',
    'Hm',
    'Hms',
    'j',
    'jm',
    'jms',
    'jmv',
    'jmz',
    'jv',
    'jz',
    'ms',
  ];
}
