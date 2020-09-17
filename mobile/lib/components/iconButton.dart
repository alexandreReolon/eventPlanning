import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';

Widget iconButton({text, icon, color}) {
  return Container(
    child: Chip(
      backgroundColor: PRIMARY_COLOR,
      padding: EdgeInsets.all(10),
      label: Text(
        text.toString(),
        style: TextStyle(
          color: color,
        ),
      ),
      avatar: CircleAvatar(
        maxRadius: 100,
        minRadius: 100,
        backgroundColor: Colors.grey,
        child: Icon(
          icon,
          color: color,
          size: 25,
        ),
      ),
    ),
  );
}
