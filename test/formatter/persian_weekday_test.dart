import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:test/test.dart';

void main() {
  test('PersianMonth', () {
    expect(
      () => PersianWeekday.byWeekday(15),
      throwsA(const TypeMatcher<AssertionError>()),
    );
    expect(
      PersianWeekday.byWeekday(5),
      const TypeMatcher<PersianWeekday>(),
    );
    expect(
      () => PersianWeekday.byPersianWeekDay(15),
      throwsA(const TypeMatcher<AssertionError>()),
    );
    expect(
      PersianWeekday.byPersianWeekDay(5),
      const TypeMatcher<PersianWeekday>(),
    );
  });
}
