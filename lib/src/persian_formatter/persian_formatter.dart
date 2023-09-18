// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

import '../../jalali_date_time.dart';

/*
 ICU Name                   Skeleton
 --------                   --------
 DAY                          d
 ABBR_WEEKDAY                 E // Sunday
 WEEKDAY                      EEEE
 ABBR_STANDALONE_MONTH        LLL
 STANDALONE_MONTH             LLLL
 NUM_MONTH                    M
 NUM_MONTH_DAY                Md
 NUM_MONTH_WEEKDAY_DAY        MEd
 ABBR_MONTH                   MMM
 ABBR_MONTH_DAY               MMMd
 ABBR_MONTH_WEEKDAY_DAY       MMMEd
 MONTH                        MMMM
 MONTH_DAY                    MMMMd
 MONTH_WEEKDAY_DAY            MMMMEEEEd
 ABBR_QUARTER                 QQQ
 QUARTER                      QQQQ
 YEAR                         y
 YEAR_NUM_MONTH               yM
 YEAR_NUM_MONTH_DAY           yMd
 YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
 YEAR_ABBR_MONTH              yMMM
 YEAR_ABBR_MONTH_DAY          yMMMd
 YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
 YEAR_MONTH                   yMMMM
 YEAR_MONTH_DAY               yMMMMd
 YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
 YEAR_ABBR_QUARTER            yQQQ
 YEAR_QUARTER                 yQQQQ
 HOUR24                       H
 HOUR24_MINUTE                Hm
 HOUR24_MINUTE_SECOND         Hms
 HOUR                         j
 HOUR_MINUTE                  jm
 HOUR_MINUTE_SECOND           jms
 HOUR_MINUTE_GENERIC_TZ       jmv   (not yet implemented)
 HOUR_MINUTE_TZ               jmz   (not yet implemented)
 HOUR_GENERIC_TZ              jv    (not yet implemented)
 HOUR_TZ                      jz    (not yet implemented)
 MINUTE                       m
 MINUTE_SECOND                ms
 SECOND                       s
 */
class PersianFormatter {
  PersianFormatter([
    String initialFormat = '',
  ]) : _format = [initialFormat];
  PersianFormatter._(this._format);
  PersianFormatter.d() : this('d');
  PersianFormatter.E() : this('E');
  PersianFormatter.EEEE() : this('EEEE');
  PersianFormatter.LLL() : this('LLL');
  PersianFormatter.LLLL() : this('LLLL');
  PersianFormatter.M() : this('M');
  PersianFormatter.Md() : this('Md');
  PersianFormatter.MEd() : this('MEd');
  PersianFormatter.MMM() : this('MMM');
  PersianFormatter.MMMd() : this('MMMd');
  PersianFormatter.MMMEd() : this('MMMEd');
  PersianFormatter.MMMM() : this('MMMM');
  PersianFormatter.MMMMd() : this('MMMMd');
  PersianFormatter.MMMMEEEEd() : this('MMMMEEEEd');
  PersianFormatter.QQQ() : this('QQQ');
  PersianFormatter.QQQQ() : this('QQQQ');
  PersianFormatter.y() : this('y');
  PersianFormatter.yM() : this('yM');
  PersianFormatter.yMd() : this('yMd');
  PersianFormatter.yMEd() : this('yMEd');
  PersianFormatter.yMMM() : this('yMMM');
  PersianFormatter.yMMMd() : this('yMMMd');
  PersianFormatter.yMMMEd() : this('yMMMEd');
  PersianFormatter.yMMMM() : this('yMMMM');
  PersianFormatter.yMMMMd() : this('yMMMMd');
  PersianFormatter.yMMMMEEEEd() : this('yMMMMEEEEd');
  PersianFormatter.yQQQ() : this('yQQQ');
  PersianFormatter.yQQQQ() : this('yQQQQ');
  PersianFormatter.H() : this('H');
  PersianFormatter.Hm() : this('Hm');
  PersianFormatter.Hms() : this('Hms');
  PersianFormatter.j() : this('j');
  PersianFormatter.jm() : this('jm');
  PersianFormatter.jms() : this('jms');

  final List<String> _format;
  PersianFormatter addPattern(String addition) => PersianFormatter._(
        [
          ..._format,
          addition,
        ].where((element) => element.isNotEmpty).toList(),
      );
  String format(JalaliDateTime dateTime) => //
      _internalFormatter(dateTime, _format);
  String _internalFormatter(JalaliDateTime dateTime, List<String> formatList) {
    if (formatList.isEmpty) {
      return '';
    }
    final current = formatList.removeLast();
    final formatter = _formatMap(current);
    return '${_internalFormatter(dateTime, formatList)}${formatter(dateTime)}';
  }

  String call(JalaliDateTime dateTime) => format(dateTime);
  PersianFormatter add_d() => addPattern('d');
  PersianFormatter add_E() => addPattern('E');
  PersianFormatter add_EEEE() => addPattern('EEEE');
  PersianFormatter add_LLL() => addPattern('LLL');
  PersianFormatter add_LLLL() => addPattern('LLLL');
  PersianFormatter add_M() => addPattern('M');
  PersianFormatter add_Md() => addPattern('Md');
  PersianFormatter add_MEd() => addPattern('MEd');
  PersianFormatter add_MMM() => addPattern('MMM');
  PersianFormatter add_MMMd() => addPattern('MMMd');
  PersianFormatter add_MMMEd() => addPattern('MMMEd');
  PersianFormatter add_MMMM() => addPattern('MMMM');
  PersianFormatter add_MMMMd() => addPattern('MMMMd');
  PersianFormatter add_MMMMEEEEd() => addPattern('MMMMEEEEd');
  PersianFormatter add_QQQ() => addPattern('QQQ');
  PersianFormatter add_QQQQ() => addPattern('QQQQ');
  PersianFormatter add_y() => addPattern('y');
  PersianFormatter add_yM() => addPattern('yM');
  PersianFormatter add_yMd() => addPattern('yMd');
  PersianFormatter add_yMEd() => addPattern('yMEd');
  PersianFormatter add_yMMM() => addPattern('yMMM');
  PersianFormatter add_yMMMd() => addPattern('yMMMd');
  PersianFormatter add_yMMMEd() => addPattern('yMMMEd');
  PersianFormatter add_yMMMM() => addPattern('yMMMM');
  PersianFormatter add_yMMMMd() => addPattern('yMMMMd');
  PersianFormatter add_yMMMMEEEEd() => addPattern('yMMMMEEEEd');
  PersianFormatter add_yQQQ() => addPattern('yQQQ');
  PersianFormatter add_yQQQQ() => addPattern('yQQQQ');
  PersianFormatter add_H() => addPattern('H');
  PersianFormatter add_Hm() => addPattern('Hm');
  PersianFormatter add_Hms() => addPattern('Hms');
  PersianFormatter add_j() => addPattern('j');
  PersianFormatter add_jm() => addPattern('jm');
  PersianFormatter add_jms() => addPattern('jms');
  String Function(JalaliDateTime) _formatMap(String format) {
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
      'Md' => PersianFormatter._(['M', '/', 'd']).format,
      'MEd' => PersianFormatter._(['E', ', ', 'Md']).format,
      'MMMd' => PersianFormatter._(['MMM', ' ', 'd']).format,
      'MMMMd' => PersianFormatter._(['MMM', ' ', 'd']).format,
      'MMMEd' => PersianFormatter._(['E', ', ', 'MMMd']).format,
      'MMMMEEEEd' => PersianFormatter._(['E', ', ', 'MMMd']).format,
      'QQQ' => (dt) => 'فصل ${dt.month ~/ 4}',
      'QQQQ' => PersianFormatter._(['QQQ']).format,
      'y' => (dt) => dt.year.toString(),
      'yM' => PersianFormatter._(['y', '-', 'MM']).format,
      'yMd' => PersianFormatter._(['y', '-', 'MM', '-', 'dd']).format,
      'yMEd' => PersianFormatter._(['E', ', ', 'yMd']).format,
      'yMMM' => PersianFormatter._(['y', '-', 'MMM']).format,
      'yMMMd' => PersianFormatter._(['yMMM', '-', 'dd']).format,
      'yMMMEd' => PersianFormatter._(['E', ', ', 'yMMMd']).format,
      'yMMMM' => PersianFormatter._(['y', '-', 'MMMM']).format,
      'yMMMMd' => PersianFormatter._(['yMMMM', '-', 'dd']).format,
      'yMMMMEEEEd' => PersianFormatter._(['E', ', ', 'yMMMMd']).format,
      'H' => (dt) => DateFormat.H().format(dt.toDateTime()),
      'm' => (dt) => DateFormat.m().format(dt.toDateTime()),
      's' => (dt) => DateFormat.s().format(dt.toDateTime()),
      'Hm' => (dt) => DateFormat.Hm().format(dt.toDateTime()),
      'Hms' => (dt) => DateFormat.Hms().format(dt.toDateTime()),
      'j' => (dt) => DateFormat.j().format(dt.toDateTime()),
      'jm' => (dt) => DateFormat.jm().format(dt.toDateTime()),
      'jms' => (dt) => DateFormat.jms().format(dt.toDateTime()),
      'jmv' => (dt) => DateFormat.jmv().format(dt.toDateTime()),
      'jmz' => (dt) => DateFormat.jmz().format(dt.toDateTime()),
      'jv' => (dt) => DateFormat.jv().format(dt.toDateTime()),
      'jz' => (dt) => DateFormat.jz().format(dt.toDateTime()),
      'ms' => (dt) => DateFormat.ms().format(dt.toDateTime()),
      _ => (_) => format,
    };
  }
  /*


ABBR_QUARTER (yQQQ):
Example: 2023-Q3

YEAR_QUARTER (yQQQQ):
Example: 2023-3rd quarter

*/
}
