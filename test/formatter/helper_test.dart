import 'package:jalali_date_time/jalali_date_time.dart';
import 'package:test/test.dart';

void main() {
  test('toFormat', () {
    final tDt = DateTime(2020, 9, 11, 15, 35, 16);
    final tJdt = JalaliDateTime.fromDateTime(tDt);
    expect(tDt.toFormat('ms'), tJdt.toFormat('ms'));
  });
}
