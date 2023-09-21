// ignore_for_file: prefer_function_declarations_over_variables

import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:test/test.dart';

void main() {
  group(
    'GlobalDate',
    () {
      test(
        'constructors',
        () {
          const t = GlobalDateInformation(
            year: 1900,
            month: 6,
            day: 16,
            dateType: DateType.gregorian,
          );
          expect(t, const TypeMatcher<GlobalDateInformation>());
          expect(t.dateType, DateType.gregorian);
          expect(t.year, 1900);
          expect(t.month, 6);
          expect(t.day, 16);
          final j = GlobalDateInformation.fromJalali(
            1900,
            6,
            16,
          );
          expect(j, const TypeMatcher<GlobalDateInformation>());
          expect(j.dateType, DateType.jalali);
          expect(j.year, 1900);
          expect(j.month, 6);
          expect(j.day, 16);
          final g = GlobalDateInformation.fromGregorian(
            1900,
            6,
            16,
          );
          expect(g, const TypeMatcher<GlobalDateInformation>());
          expect(g.dateType, DateType.gregorian);
          expect(g.year, 1900);
          expect(g.month, 6);
          expect(g.day, 16);
          expect(g, t);
          final dt = DateTime(2020, 5, 15);
          final tFdt = GlobalDateInformation.fromDateTime(dt);
          expect(tFdt, const TypeMatcher<GlobalDateInformation>());
          expect(tFdt.dateType, DateType.gregorian);
          expect(tFdt.year, dt.year);
          expect(tFdt.month, dt.month);
          expect(tFdt.day, dt.day);
        },
      );
      test(
        'constructors - assertion',
        () {
          final jLeapError = () => GlobalDateInformation.fromJalali(
                1402,
                12,
                30,
              );
          expect(jLeapError, throwsA(const TypeMatcher<AssertionError>()));
          final jLeapCorrect = () => GlobalDateInformation.fromJalali(
                1399,
                12,
                30,
              );
          expect(jLeapCorrect(), const TypeMatcher<GlobalDateInformation>());
          final jRangeError = () => GlobalDateInformation.fromJalali(
                1402,
                13,
                5,
              );
          expect(jRangeError, throwsA(const TypeMatcher<AssertionError>()));

          final gLeapError = () => GlobalDateInformation.fromGregorian(
                2023,
                2,
                29,
              );
          expect(gLeapError, throwsA(const TypeMatcher<AssertionError>()));
          final gLeapCorrect = () => GlobalDateInformation.fromGregorian(
                2024,
                2,
                29,
              );
          expect(gLeapCorrect(), const TypeMatcher<GlobalDateInformation>());
          final gRangeError = () => GlobalDateInformation.fromGregorian(
                2024,
                13,
                5,
              );
          expect(gRangeError, throwsA(const TypeMatcher<AssertionError>()));
        },
      );
      test('toString', () {
        final j = GlobalDateInformation.fromJalali(
          1402,
          12,
          29,
        );
        expect(j.toString(), const TypeMatcher<String>());
        expect(
          j.hashCode,
          j.year.hashCode ^ //
              j.month.hashCode ^
              j.day.hashCode ^
              j.dateType.hashCode << 30,
        );
      });
      test('self mapping', () {
        final j = GlobalDateInformation.fromJalali(
          1900,
          6,
          16,
        );
        expect(j, j.toJalaliDate());

        final g = GlobalDateInformation.fromGregorian(
          1900,
          6,
          16,
        );
        expect(g, g.toGregorianDate());
      });
    },
  );
}
