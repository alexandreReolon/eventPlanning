import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/constants.dart';

Widget naoHaDados() {
  return FadeAnimation(
    1.8,
    Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 150,
              width: 150,
              child: FlareActor(
                "assets/animations/calendario.flr",
                animation: "calendario",
                fit: BoxFit.fill,
              )),
          Text(
            "Ops, Nenhum evento encontrado.",
            style: TextStyle(
              fontSize: 18.0,
              color: CColors.TEXT_COLOR,
            ),
          ),
        ],
      ),
    ),
  );
}
