import 'package:flutter/material.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
              1.2,
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 40,
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.5,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PRIMARY_COLOR),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: SECUNDARY_COLOR[300]),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: SECUNDARY_COLOR.withOpacity(.8),
                            ),
                            hintText: "Digite seu email"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.8),
                            ),
                            hintText: "Digite sua senha"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FadeAnimation(
              1.8,
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: HomePage()));
                  },
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: TERTIARY_COLOR[800],
                    ),
                    child: Center(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: PRIMARY_COLOR.withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
