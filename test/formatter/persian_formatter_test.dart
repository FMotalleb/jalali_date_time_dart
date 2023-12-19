import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:test/test.dart';

void main() {
  group('Formatter', () {
    test('initialize', () {
      final constructors = {
        'E': PersianDateTimeFormat.E,
        'd': PersianDateTimeFormat.d,
        'EEEE': PersianDateTimeFormat.EEEE,
        'LLL': PersianDateTimeFormat.LLL,
        'LLLL': PersianDateTimeFormat.LLLL,
        'M': PersianDateTimeFormat.M,
        'Md': PersianDateTimeFormat.Md,
        'MMM': PersianDateTimeFormat.MMM,
        'MEd': PersianDateTimeFormat.MEd,
        'MMMd': PersianDateTimeFormat.MMMd,
        'MMMEd': PersianDateTimeFormat.MMMEd,
        'MMMM': PersianDateTimeFormat.MMMM,
        'MMMMd': PersianDateTimeFormat.MMMMd,
        'MMMMEEEEd': PersianDateTimeFormat.MMMMEEEEd,
        'QQQ': PersianDateTimeFormat.QQQ,
        'QQQQ': PersianDateTimeFormat.QQQQ,
        'y': PersianDateTimeFormat.y,
        'yM': PersianDateTimeFormat.yM,
        'yMd': PersianDateTimeFormat.yMd,
        'yMEd': PersianDateTimeFormat.yMEd,
        'yMMM': PersianDateTimeFormat.yMMM,
        'yMMMd': PersianDateTimeFormat.yMMMd,
        'yMMMEd': PersianDateTimeFormat.yMMMEd,
        'yMMMM': PersianDateTimeFormat.yMMMM,
        'yMMMMd': PersianDateTimeFormat.yMMMMd,
        'yMMMMEEEEd': PersianDateTimeFormat.yMMMMEEEEd,
        'yQQQ': PersianDateTimeFormat.yQQQ,
        'yQQQQ': PersianDateTimeFormat.yQQQQ,
        'H': PersianDateTimeFormat.H,
        'Hm': PersianDateTimeFormat.Hm,
        'Hms': PersianDateTimeFormat.Hms,
        'j': PersianDateTimeFormat.j,
        'jm': PersianDateTimeFormat.jm,
        'jms': PersianDateTimeFormat.jms,
        'y M d': () => PersianDateTimeFormat('y M').addPattern('d'),
        'y E': PersianDateTimeFormat.y().add_E,
        'y d': PersianDateTimeFormat.y().add_d,
        'y EEEE': PersianDateTimeFormat.y().add_EEEE,
        'y LLL': PersianDateTimeFormat.y().add_LLL,
        'y LLLL': PersianDateTimeFormat.y().add_LLLL,
        'y M': PersianDateTimeFormat.y().add_M,
        'y Md': PersianDateTimeFormat.y().add_Md,
        'y MMM': PersianDateTimeFormat.y().add_MMM,
        'y MEd': PersianDateTimeFormat.y().add_MEd,
        'y MMMd': PersianDateTimeFormat.y().add_MMMd,
        'y MMMEd': PersianDateTimeFormat.y().add_MMMEd,
        'y MMMM': PersianDateTimeFormat.y().add_MMMM,
        'y MMMMd': PersianDateTimeFormat.y().add_MMMMd,
        'y MMMMEEEEd': PersianDateTimeFormat.y().add_MMMMEEEEd,
        'y QQQ': PersianDateTimeFormat.y().add_QQQ,
        'y QQQQ': PersianDateTimeFormat.y().add_QQQQ,
        'y y': PersianDateTimeFormat.y().add_y,
        'y yM': PersianDateTimeFormat.y().add_yM,
        'y m': PersianDateTimeFormat.y().add_m,
        'y yMd': PersianDateTimeFormat.y().add_yMd,
        'y yMEd': PersianDateTimeFormat.y().add_yMEd,
        'y yMMM': PersianDateTimeFormat.y().add_yMMM,
        'y yMMMd': PersianDateTimeFormat.y().add_yMMMd,
        'y yMMMEd': PersianDateTimeFormat.y().add_yMMMEd,
        'y yMMMM': PersianDateTimeFormat.y().add_yMMMM,
        'y yMMMMd': PersianDateTimeFormat.y().add_yMMMMd,
        'y yMMMMEEEEd': PersianDateTimeFormat.y().add_yMMMMEEEEd,
        'y yQQQ': PersianDateTimeFormat.y().add_yQQQ,
        'y yQQQQ': PersianDateTimeFormat.y().add_yQQQQ,
        'y H': PersianDateTimeFormat.y().add_H,
        'y Hm': PersianDateTimeFormat.y().add_Hm,
        'y Hms': PersianDateTimeFormat.y().add_Hms,
        'y j': PersianDateTimeFormat.y().add_j,
        'y jm': PersianDateTimeFormat.y().add_jm,
        'y jms': PersianDateTimeFormat.y().add_jms,
      };
      for (final i in constructors.entries) {
        final formatter = i.value();
        expect(formatter.pattern, i.key);
      }
      final format = PersianDateTimeFormat.MMMMEEEEd();
      final format2 = PersianDateTimeFormat.yMMMMEEEEd();
      expect(
        format.format(JalaliDateTime.now()),
        const TypeMatcher<String>(),
      );
      expect(
        format2.format(JalaliDateTime.now()),
        const TypeMatcher<String>(),
      );
    });
    test('Simple format', () {
      final dt = DateTime(1986, 04, 26, 1, 23, 40);
      final jDt = JalaliDateTime.fromDateTime(dt);
      final formatter = PersianDateTimeFormat.yMd();
      final formatter2 = PersianDateTimeFormat.yMd();
      final formatter3 = PersianDateTimeFormat('y m d');
      final formatter4 = PersianDateTimeFormat('y d m');
      expect(formatter2, formatter);
      expect(formatter.hashCode, formatter2.hashCode);
      expect(formatter3.hashCode, isNot(formatter4.hashCode));
      expect(formatter(jDt), formatter.format(jDt));
      expect(formatter.format(jDt), '1365/02/06');
    });
  });
}
