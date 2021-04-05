import 'package:flutter/material.dart';
import 'package:eventPlanning/constants.dart';

Widget buttonFilter({
  String txt,
  int value,
  int valueField,
  Function onclick,
}) {
  bool isSelected = value == valueField;

  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: isSelected ? CColors.COLOR_PRIMARY : CColors.nearlyWhite,
          border: Border.all(color: CColors.COLOR_PRIMARY)),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onclick(valueField);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.30,
                    color: isSelected
                        ? CColors.nearlyWhite
                        : CColors.COLOR_PRIMARY),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
