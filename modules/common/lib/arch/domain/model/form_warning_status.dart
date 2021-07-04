import 'package:common/arch/domain/model/img_data.dart';

class FormWarningStatus {
  final String desc;
  final String action;
  final bool isSafe;
  final ImgData img;

  FormWarningStatus({
    required this.desc,
    required this.action,
    required this.isSafe,
    required this.img,
  });
}