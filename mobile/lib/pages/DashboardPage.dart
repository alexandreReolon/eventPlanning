import 'package:eventPlanning/widgets/hora_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPage createState() => _DashBoardPage();
}

class _DashBoardPage extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .47,
            right: 20.0,
            left: 20.0),
        child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              primary: false,
              children: <Widget>[
                HoraEvent(
                  name: "Cash",
                  amount: r"$1000.22",
                )
              ],
            )));
  }
}
