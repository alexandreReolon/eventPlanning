import 'package:flutter/material.dart';
import 'package:eventPlanning/constants.dart';

Widget button({text}) {
  return Container(
    width: 200,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: CColors.COLOR_PRIMARY,
    ),
    child: Center(
      child: Text(
        text.toString().toUpperCase(),
        style: TextStyle(
          color: CColors.COLOR_PRIMARY.withOpacity(.7),
        ),
      ),
    ),
  );
}
