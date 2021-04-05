import 'package:flutter/material.dart';

Widget CardEvent({context}) {
  return Container(
    height: 50,
    margin: EdgeInsets.all(16),
    child: Material(
      type: MaterialType.card,
      color: Colors.red,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      borderOnForeground: true,
      clipBehavior: Clip.none,
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        //margin: margin,
        //padding: padding,
        decoration: BoxDecoration(
          //shape: shape,
          //borderRadius: borderRadius,
          //border: border,
          color: Colors.green,
          image: DecorationImage(
            //fit: BoxFit(),
            //colorFilter: colorFilter,
            image: new ExactAssetImage("assets/images/event.jpg"),
          ),
        ),
      ),
    ),
  );
}
