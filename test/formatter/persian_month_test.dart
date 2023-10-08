import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:test/test.dart';

void main() {
  test('PersianMonth', () {
    expect(
      () => PersianMonth.fromMonthIndex(13),
      throwsA(const TypeMatcher<AssertionError>()),
    );
    expect(
      PersianMonth.values[0].monthIndex,
      1,
    );
  });
}
