import 'dart:convert';
import 'dart:typed_data';

import 'package:eventPlanning/constants.dart';
import 'package:flutter/material.dart';

Widget cardEvent({image, title, mes, date, hour}) {
  Uint8List bytes = base64.decode(image);

  return Row(
    children: <Widget>[
      Container(
        width: 50,
        height: 60,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: CColors.SECUNDARY_COLOR,
              ),
              child: Column(
                children: [
                  Text(
                    date.toString(),
                    style: TextStyle(
                      color: CColors.TEXTO_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mes.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: CColors.TEXTO_COLOR,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("assets/images/event.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title.toString(),
                  style: TextStyle(
                    color: CColors.TEXTO_COLOR,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: CColors.TEXTO_COLOR,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      hour.toString(),
                      style: TextStyle(
                        color: CColors.TEXTO_COLOR,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
