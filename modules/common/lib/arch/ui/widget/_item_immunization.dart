
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemImmunizationFill extends StatelessWidget {
  final String immunizationName;
  final String? date; //null if a person hasn't taken immunization.
  final String? descLeft;
  final String? descRight;
  final void Function()? onBtnClick;

  ItemImmunizationFill({
    required this.immunizationName,
    this.date,
    this.descLeft,
    this.descRight,
    this.onBtnClick,
  });

  factory ItemImmunizationFill.fromData(
      UiImmunizationListItem data, {
      void Function()? onBtnClick,
  }) {
    final detail = data.detail;
    String? descRight;
    String? descLeft;

    if(detail != null) {
      descLeft = "Bulan ke ";
      if(detail.monthExact != null) {
        descLeft += detail.monthExact.toString() +".";
      } else if(detail.monthRange != null) {
        final start = detail.monthRange!.start;
        final end = detail.monthRange!.end;
        descLeft += "$start-$end.";
      }
      descRight = "No. Batch: ${detail.batchNo ?? "-"}";
    }
    return ItemImmunizationFill(
      immunizationName: data.core.name,
      date: data.core.date,
      descLeft: descLeft,
      descRight: descRight,
      onBtnClick: onBtnClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color txtColor;
    Color txtCardColor;
    Color cardColor;
    Color bgColor;

    if(date == null) {
      txtColor = Manifest.theme.textBodyColor;
      txtCardColor = Manifest.theme.colorOnPrimary;
      cardColor = Manifest.theme.colorPrimary;
      bgColor = grey_calm;
    } else {
      txtColor = Manifest.theme.colorOnPrimary;
      txtCardColor = Manifest.theme.colorPrimary;
      cardColor = Manifest.theme.colorOnPrimary;
      bgColor = Manifest.theme.colorPrimary;
    }

    final upperWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          immunizationName,
          style: SibTextStyles.size_min_1.copyWith(color: txtColor),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: onBtnClick,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: cardColor,
              boxShadow: [BoxShadow(),],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                date ?? "Konfirmasi",
                style: SibTextStyles.size_min_1.copyWith(color: txtCardColor),
              ),
            ),
          ),
        ),
      ],
    );

    final columnChildren = <Widget>[upperWidget];

    //Widget? belowWidget;
    if(descLeft != null || descRight != null) {
      final belowChildren = <Widget>[];
      if(descLeft != null) {
        belowChildren.add(
          Text(
            descLeft!,
            style: SibTextStyles.size_min_2.copyWith(color: txtColor),
          ),
        );
      }
      if(descRight != null) {
        belowChildren.add(
          Align(
            alignment: Alignment.topRight,
            child: Text(
              descRight!,
              style: SibTextStyles.size_min_2.copyWith(color: txtColor),
            ),
          ),
        );
      }
      final belowWidget = Row(
        children: belowChildren,
      );
      columnChildren.add(belowWidget);
    }

    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: columnChildren,
        ),
      ),
    );
  }
}


class ImmunizationOverviewView extends StatelessWidget {
  final Widget image;
  final String text;

  ImmunizationOverviewView({
    required this.image,
    required this.text,
  });

  ImmunizationOverviewView.fromData(UiImmunizationOverview data):
     text = data.text,
     image = Container(color: Manifest.theme.colorPrimary,)
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 120.0;
    return Container(
      height: parentHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              width: 80,
              child: image,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              text,
              style: SibTextStyles.size_min_1_bold,
            ),
          ),

        ],
      ),
    );
  }
}