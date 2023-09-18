enum PersianMonth {
  farvardin(persianName: 'فروردین'),
  ordibehesht(persianName: 'اردیبهشت'),
  khordad(persianName: 'خرداد'),
  tir(persianName: 'تیر'),
  mordad(persianName: 'مرداد'),
  shahrivar(persianName: 'شهریور'),
  mehr(persianName: 'مهر'),
  aban(persianName: 'آبان'),
  azar(persianName: 'آذر'),
  dey(persianName: 'دی'),
  bahman(persianName: 'بهمن'),
  esfand(persianName: 'اسفند'),
  ;

  const PersianMonth({required this.persianName});
  factory PersianMonth.fromMonthIndex(int index) {
    assert(
      index > 0 && index <= 12,
      'Given index ($index) is out of range (1-12)',
    );
    return values[index - 1];
  }
  final String persianName;
  int get monthIndex => index + 1;
}
