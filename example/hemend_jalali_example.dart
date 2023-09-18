// ignore_for_file: avoid_print

import 'package:global_date_time/global_date_time.dart';

void main() {
  final berlinWallFell = JalaliDateTime.fromDateTime(
    DateTime(1989, DateTime.november, 9),
  );
  final dDay = JalaliDateTime.fromDateTime(
    DateTime(1944, DateTime.june, 6),
  );

  final difference = berlinWallFell.difference(dDay);
  print(difference.inDays); // 16592
}
