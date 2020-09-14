import 'package:flutter/material.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/components/menu.dart';

class HomePage extends StatelessWidget {
  var drawer = MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      drawer: drawer,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                makeItem(
                    image: 'assets/images/beacon.png',
                    title: 'Semana academica',
                    mes: 'setembro',
                    date: 17,
                    hour: '19:00'),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.3,
                makeItem(
                    image: 'assets/images/beacon.png',
                    title: 'Semana academica',
                    mes: 'setembro',
                    date: 17,
                    hour: '19:00'),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.4,
                makeItem(
                    image: 'assets/images/beacon.png',
                    title: 'Semana academica',
                    mes: 'setembro',
                    date: 17,
                    hour: '19:00'),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.5,
                makeItem(
                    image: 'assets/images/beacon.png',
                    title: 'Semana academica',
                    mes: 'setembro',
                    date: 17,
                    hour: '19:00'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, title, mes, date, hour}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: <Widget>[
              Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                mes.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(
              //     image: AssetImage(image), fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    title.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        hour.toString(),
                        style: TextStyle(color: Colors.white),
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
}
