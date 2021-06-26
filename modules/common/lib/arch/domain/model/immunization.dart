
import 'package:core/domain/model/range.dart';

class ImmunizationData {
  final String name;
  final String? date; //null if the person hasn't taken it.

  ImmunizationData({
    required this.name,
    this.date,
  });
}


/// [monthExact] and [monthExact] can't be displayed at the same time.
/// So both [monthExact] and [monthExact] are present, then [monthExact] takes precedence.
/// But, both [monthExact] and [monthExact] cant be null.
class ImmunizationDetail {
  final ImmunizationData immunization;
  final IntRange? monthRange;
  final int? monthExact;
  final int? maxMonthLimit;
  final String? batchNo;
  final bool noDetail;

  ImmunizationDetail({
    required this.immunization,
    this.maxMonthLimit,
    this.monthRange,
    this.monthExact,
    this.batchNo,
    this.noDetail = false,
  }) {
    if(!noDetail) {
      if(immunization.date != null && batchNo == null
          || immunization.date == null && batchNo != null) {
        throw "If immunization.date != null then batchNo != null. \n"
            "If immunization.date == null then batchNo == null. \n"
            "Current immunization.date = '${immunization.date}', current batchNo = '$batchNo'";
      }
      if(monthExact == null && monthRange == null) {
        throw "both `monthExact` and `monthExact` can't be null";
      }
    }
  }
}


class ImmunizationDetailGroup {
  final List<ImmunizationDetail> immunizationList;
  final String header;

  ImmunizationDetailGroup({
    required this.immunizationList,
    required this.header,
  });
}


class ImmunizationOverview {
  final String text;
  final String imgLink;

  ImmunizationOverview({
    required this.imgLink,
    required this.text,
  });
}