import 'package:flutter/material.dart';
import 'package:eventPlanning/Constants.dart';

Widget button({text}) {
  return Container(
    width: 200,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: CColors.TERTIARY_COLOR,
    ),
    child: Center(
      child: Text(
        text.toString().toUpperCase(),
        style: TextStyle(
          color: CColors.PRIMARY_COLOR.withOpacity(.7),
        ),
      ),
    ),
  );
}
