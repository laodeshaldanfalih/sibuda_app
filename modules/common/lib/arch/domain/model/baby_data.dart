import 'package:common/arch/domain/model/img_data.dart';

class BabyAgeOverview {
  final int year; //If 0, it won't be displayed on screen. This applies to other fields.
  final int month;
  final int day;

  BabyAgeOverview({
    required this.year,
    required this.month,
    required this.day,
  });
}

class BabyFormMenuData {
  final int year;
  final int monthStart;
  final int monthEnd;

  BabyFormMenuData({
    required this.year,
    required this.monthStart,
    required this.monthEnd,
  });
}

class ChartMenuData {
  final String title;
  final ImgData img;

  ChartMenuData({
    required this.title,
    required this.img,
  });
}