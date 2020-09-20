import 'package:eventPlanning/Constants.dart';
import 'package:eventPlanning/components/CardEvent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future<List<String>> agenda;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () => {},
                      child: Text(
                        "ADS",
                        style: TextStyle(color: PRIMARY_COLOR),
                      )),
                ],
              ),
              FutureBuilder(
                future: agenda,
                builder: (BuildContext, snapshort) {
                  return cardEvent(
                    image: 'images/event.png',
                    title: 'Semana academica',
                    mes: 'SET',
                    hour: '19:00',
                    date: 17,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
