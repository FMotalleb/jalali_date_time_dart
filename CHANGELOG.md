## 1.3.0

* (Minor) Fixed package version boundaries
    > no public API change but the output of date formats that formerly used `-` in their output like `yM` is parsed as `y/m` (old: `y-m`)
    >
## 1.2.0

* (Minor) Fixed package version boundaries

## 1.1.5

* (Minor) Bump package versions

## 1.1.4

* (Fix) PersianDateFormat's addPattern was not acting like DateFormat's addPattern
* (Perf) calling pattern related methods on an instance of PersianDateFormat has will not trigger parser

## 1.1.3

* (Tests) tests on JalaliDateTime + Core features

## 1.1.2

* (Fix) (Persian/Normal) DateTime formatter extensions

## 1.1.1

### Major

* Changed the class name from `PersianFormatter` to `PersianDateTimeFormat`.

* Fixed a pattern addition bug. For example, if you initialize the pattern with `H` and then add `m` to it, the pattern must be `Hm`. However, it was tokenized as `['H', 'm']`. As a result, the final formatting for `09:15` was `0915`. To achieve the correct result, you had to add a `:` before adding the `m`.

### Minor

* Added documentation to `PersianDateTimeFormat`.

* Updated examples to match the new formatting system.
* Updated `JalaliDateTime.ToString()` to the new formatting system.
* Changed the name of the `toDateTime` method to `getDateTime` since it's not a map method but rather just a getter.

## 1.1.0

* (Feat) Persian DateTime formatter

## 1.0.3

* (Feat) DateTime to JalaliDateTime extension

## 1.0.2

* (Feat) added parse and tryParse contractors to JalaliDateTime

## 1.0.1

* Initial version.
