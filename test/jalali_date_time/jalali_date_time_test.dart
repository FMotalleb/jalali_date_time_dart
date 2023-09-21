// ignore_for_file: avoid_catches_without_on_clauses

import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<DateTime>(),
])
import 'jalali_date_time_test.mocks.dart';

void main() {
  group(
    'JalaliDateTime',
    () {
      // Mocked instance
      late JalaliDateTime jInstance;
      late DateTime mDt;
      setUp(() {
        final mockDateTime = MockDateTime();
        when(mockDateTime.year).thenReturn(1986);
        when(mockDateTime.month).thenReturn(4);
        when(mockDateTime.day).thenReturn(26);
        when(mockDateTime.hour).thenReturn(1);
        when(mockDateTime.minute).thenReturn(23);
        when(mockDateTime.second).thenReturn(40);
        // when(mockDateTime.day).thenReturn(26);
        mDt = mockDateTime;
        jInstance = JalaliDateTime.fromDateTime(mDt);
      });
      test(
        'constructors',
        () {
          const intialMilis = 1695279952000;
          final ms = JalaliDateTime.fromMillisecondsSinceEpoch(intialMilis);
          expect(ms.millisecondsSinceEpoch, intialMilis);
          final us = //
              JalaliDateTime.fromMicrosecondsSinceEpoch(intialMilis * 1000);
          expect(us.microsecondsSinceEpoch, intialMilis * 1000);

          expect(JalaliDateTime(1400), const TypeMatcher<JalaliDateTime>());

          final dt = DateTime(2020);
          expect(
            JalaliDateTime.parse(dt.toIso8601String()),
            const TypeMatcher<JalaliDateTime>(),
          );
          expect(
            JalaliDateTime.tryParse(dt.toIso8601String()),
            const TypeMatcher<JalaliDateTime>(),
          );
          expect(
            JalaliDateTime.tryParse('${dt.toIso8601String()}broken'),
            const TypeMatcher<void>(),
          );
          expect(
            JalaliDateTime.utc(1400),
            const TypeMatcher<JalaliDateTime>(),
          );
          expect(
            JalaliDateTime.now(),
            const TypeMatcher<JalaliDateTime>(),
          );
          expect(
            JalaliDateTime.timestamp(),
            const TypeMatcher<JalaliDateTime>(),
          );
          expect(
            JalaliDateTime.timestamp().timeZoneName,
            'UTC',
          );
        },
      );
      test(
        'DateTime Invocation',
        () {
          // These should be called during construction of the JalaliDateTime
          verify(mDt.year);
          verify(mDt.month);
          verify(mDt.day);

          expect(jInstance.year, const TypeMatcher<int>());
          verifyNever(mDt.year);
          expect(jInstance.month, const TypeMatcher<int>());
          verifyNever(mDt.month);
          expect(jInstance.day, const TypeMatcher<int>());
          verifyNever(mDt.day);

          expect(jInstance.hour, const TypeMatcher<int>());
          verify(mDt.hour);
          expect(jInstance.minute, const TypeMatcher<int>());
          verify(mDt.minute);
          expect(jInstance.second, const TypeMatcher<int>());
          verify(mDt.second);
          expect(jInstance.millisecond, const TypeMatcher<int>());
          verify(mDt.millisecond);

          _try(() => jInstance.add(const Duration(days: 1)));
          verify(mDt.add(const Duration(days: 1)));
          _try(() => jInstance.subtract(const Duration(days: 1)));
          verify(mDt.subtract(const Duration(days: 1)));

          _try(() => jInstance.isUtc);
          verify(mDt.isUtc);

          _try(() => jInstance.weekday);
          verify(mDt.weekday);

          _try(() => jInstance.microsecond);
          verify(mDt.microsecond);

          _try(() => jInstance.millisecondsSinceEpoch);
          verify(mDt.millisecondsSinceEpoch);

          _try(() => jInstance.microsecondsSinceEpoch);
          verify(mDt.microsecondsSinceEpoch);

          _try(() => jInstance.timeZoneName);
          verify(mDt.timeZoneName);

          _try(() => jInstance.timeZoneOffset);
          verify(mDt.timeZoneOffset);

          _try(() => jInstance.compareTo(jInstance));
          verify(mDt.compareTo(mDt));

          _try(() => jInstance.isAtSameMomentAs(jInstance));
          verify(mDt.isAtSameMomentAs(mDt));

          _try(() => jInstance.difference(jInstance));
          verify(mDt.difference(mDt));

          _try(() => jInstance.isAfter(jInstance));
          verify(mDt.isAfter(mDt));

          _try(() => jInstance.isBefore(jInstance));
          verify(mDt.isBefore(mDt));

          final iso = _try(() => jInstance.toIso8601String());
          verify(mDt.toIso8601String());
          expect(iso, mDt.toIso8601String());

          _try(() => jInstance.toLocal());
          verify(mDt.toLocal());

          _try(() => jInstance.toUtc());
          verify(mDt.toUtc());

          final dt = jInstance.getDateTime();
          expect(identical(dt, mDt), true);
        },
      );
      test('Equality', () {
        const milis = 1695282475000;
        final dt = DateTime.fromMillisecondsSinceEpoch(milis);
        final jDt1 = JalaliDateTime.fromMillisecondsSinceEpoch(milis);
        final jDt2 = JalaliDateTime.fromMillisecondsSinceEpoch(milis + 300);
        expect(jDt1 == jDt2, false);
        // ignore: unrelated_type_equality_checks
        expect(jDt1 == DateTime.fromMillisecondsSinceEpoch(milis), false);
        expect(
          jDt1.hashCode == DateTime.fromMillisecondsSinceEpoch(milis).hashCode,
          false,
        );

        expect(
          jDt1.hashCode,
          dt.hashCode ^ jDt1.year ^ jDt1.month ^ jDt1.day,
        );
        expect(mDt.toJalali(), jInstance);
      });
      test('String check', () {
        const milis = 1695282475000;
        final jDt1 = JalaliDateTime.fromMillisecondsSinceEpoch(milis);
        expect(jDt1.toString(), jDt1.toFormat('yMd Hms ${jDt1.timeZoneName}'));
      });
      test(
        'Internal calls',
        () {
          verify(mDt.month);
          _try(() => jInstance.jalaliWeekday);
          verify(mDt.weekday);
          _try(() => jInstance.persianMonth);
          verifyNever(mDt.month);
        },
      );
    },
  );
}

T? _try<T>(T Function() func) {
  try {
    return func();
  } catch (e) {
    // missed
  }
  return null;
}
