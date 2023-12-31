# JalaliDateTime

[![Publish to pub.dev](https://github.com/FMotalleb/jalali_date_time_dart/actions/workflows/publish.yml/badge.svg)](https://github.com/FMotalleb/jalali_date_time_dart/actions/workflows/publish.yml)
[![Tests](https://github.com/FMotalleb/jalali_date_time_dart/actions/workflows/tests.yml/badge.svg)](https://github.com/FMotalleb/jalali_date_time_dart/actions/workflows/tests.yml)
[![codecov](https://codecov.io/gh/FMotalleb/jalali_date_time_dart/graph/badge.svg?token=tRD8beEV0A)](https://codecov.io/gh/FMotalleb/jalali_date_time_dart)

JalaliDateTime is a Dart package that provides a convenient way to work with Jalali (Persian) dates while using the underlying DateTime structure for time-related methods. This approach is designed to maintain stability and efficiency in your code.

## Features

* **Jalali Date Representation**: The package allows you to easily represent Jalali dates, including year, month, and day.

* **DateTime Compatibility**: Public apis for `JalaliDateTime` is almost identical to `DateTime`.

* **Persian DateTime Format**: Includes a built-in `PersianDateTimeFormat` almost identical to `DateTimeFormat` provided by `Intl`. You can find more information about the `intl` package [here](https://pub.dev/packages/intl).

* **Efficient Design**: Each Jalali instance seamlessly holds its corresponding DateTime, minimizing overhead and computational load.

* **Stability**: For time-related or computation methods such as comparison, subtraction, and more, JalaliDateTime utilizes the DateTime methods, ensuring reliability and accuracy.

* **Super Lightweight**: This package maintains a small footprint by relying on just two dependencies: intl and meta.

## Installation

To use JalaliDateTime in your Dart project, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  jalali_date_time: <latest>
```

Then, run `flutter pub get` to fetch the package.

## Usage

Here's a basic example of how to use JalaliDateTime:

```dart
import 'package:jalali_date_time/jalali_date_time.dart';

void main() {
  // Create a JalaliDateTime instance for the current date and time
  final jalaliNow = JalaliDateTime.now();

  // Access Jalali components
  final year = jalaliNow.year;
  final month = jalaliNow.month;
  final day = jalaliNow.day;
  print('today: $year-$month-$day'); // today: 1402-6-27
  // Convert JalaliDateTime to DateTime
  final dateTime = jalaliNow.getDateTime();

  // Perform DateTime operations
  final tomorrow = dateTime.add(const Duration(days: 1));

  // Convert DateTime back to JalaliDateTime
  final jalaliTomorrow = JalaliDateTime.fromDateTime(tomorrow);
  print(jalaliTomorrow == tomorrow.toJalali()); // true
  final tyear = jalaliTomorrow.year;
  final tmonth = jalaliTomorrow.month;
  final tday = jalaliTomorrow.day;
  print('tomorrow: $tyear-$tmonth-$tday'); // tomorrow: 1402-6-28
  // Compare JalaliDateTime objects
  if (jalaliTomorrow.isAfter(jalaliNow)) {
    print('Tomorrow is after today.'); // Tomorrow is after today.
  }
  print(DateTime(1986, 4, 26, 01, 23, 40).toJalali()); // 1365-02-06 01:23:40 +0330

  print(PersianDateTimeFormat.yMMMMEEEEd().format(jalaliTomorrow)); // سه‌شنبه, 1402-شهریور-28 (correct in rtl form)
  print(jalaliTomorrow.toFormat('yMMMMEEEEd') == PersianDateTimeFormat.yMMMMEEEEd().format(jalaliTomorrow)); //true

  print(tomorrow.toFormat('yMMMMEEEEd')); // Thursday, September 19, 2023
  // DateTime
  print(tomorrow.toFormat('yMMMMEEEEd') == DateFormat.yMMMMEEEEd().format(tomorrow)); //true
}
```

## Contribution

Contributions are welcome! If you encounter any issues, have feature requests, or want to contribute code, please feel free to open an issue or create a pull request.

## License

This package is distributed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

**Note**: This package is primarily focused on providing a stable and efficient way to work with Jalali dates. For more detailed documentation and usage examples, refer to the package documentation or visit the [GitHub repository](https://github.com/fmotalleb/jalali_date_time_dart).

For additional information on the Jalali calendar, consider referencing external resources and documentation on the Persian calendar system.
