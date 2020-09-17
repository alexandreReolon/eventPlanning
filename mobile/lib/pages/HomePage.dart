import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/components/cardEvent.dart';
import 'package:flutter_app/components/iconButton.dart';
import 'package:flutter_app/components/menu.dart';

class HomePage extends StatelessWidget {
  final drawer = Menu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person_pin_circle,
                      color: TEXTO_PRIMARY_COLOR,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Text(
                "AGENDA",
                style: TextStyle(color: PRIMARY_COLOR),
              ),
              Divider(
                color: PRIMARY_COLOR,
              ),
              Row(
                children: <Widget>[
                  iconButton(
                    text: 'Proxímo',
                    icon: Icons.person_pin_circle,
                    color: TEXTO_PRIMARY_COLOR,
                  ),
                  SizedBox(width: 20),
                  iconButton(
                    text: 'Proxímo',
                    icon: Icons.person_pin_circle,
                    color: TEXTO_PRIMARY_COLOR,
                  ),
                ],
              ),
              Divider(
                color: PRIMARY_COLOR,
              ),
              FadeAnimation(
                1.2,
                cardEvent(
                  image: 'assets/images/beacon.png',
                  title: 'Semana academica',
                  mes: 'SET',
                  hour: '19:00',
                  date: 17,
                ),
              ),
              SizedBox(height: 20),
              FadeAnimation(
                1.3,
                cardEvent(
                  image: 'assets/images/beacon.png',
                  title: 'Semana academica',
                  mes: 'DEZ',
                  hour: '19:00',
                  date: 17,
                ),
              ),
              SizedBox(height: 20),
              FadeAnimation(
                1.4,
                cardEvent(
                  image: 'assets/images/beacon.png',
                  title: 'Semana academica',
                  mes: 'OUT',
                  hour: '19:00',
                  date: 17,
                ),
              ),
              SizedBox(height: 20),
              FadeAnimation(
                1.5,
                cardEvent(
                  image: 'assets/images/beacon.png',
                  title: 'Semana academica',
                  mes: 'setembro',
                  hour: '19:00',
                  date: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
