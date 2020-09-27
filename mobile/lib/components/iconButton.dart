import 'package:flutter/material.dart';
import 'package:eventPlanning/Constants.dart';

Widget iconButton({text, icon, color, onSelected}) {
  return ChoiceChip(
      label: Text(text),
      backgroundColor: color,
      avatar: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.withOpacity(0.4),
        ),
        child: Center(
          child: Icon(icon, color: Colors.white),
        ),
      ),
      onSelected: onSelected());
}
