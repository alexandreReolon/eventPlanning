import 'dart:convert';
import 'dart:developer';

import 'package:eventPlanning/components/Button.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:eventPlanning/Constants.dart';
import 'package:eventPlanning/pages/CadastrarPage.dart';
import 'package:eventPlanning/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:eventPlanning/Service.dart' as Service;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

class LoginPage extends StatelessWidget {
  final loginPageKey = GlobalKey<FormState>();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();

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
                  fontWeight: FontWeight.bold,
                ),
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
                  color: PRIMARY_COLOR,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: SECUNDARY_COLOR),
                        ),
                      ),
                      child: TextFormField(
                        controller: emailInput,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: SECUNDARY_COLOR.withOpacity(.8),
                            ),
                            border: InputBorder.none,
                            hintText: "Digite seu Email"),
                        validator: (value) {
                          return validador(value, false);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        controller: passwordInput,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: SECUNDARY_COLOR.withOpacity(.8),
                            ),
                            border: InputBorder.none,
                            hintText: "Digite sua senha"),
                        validator: (value) {
                          return validador(value, false);
                        },
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
                    this.clickLogin(context);
                  },
                  child: Button(
                    text: "Login",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              2,
              Center(
                child: InkWell(
                  onTap: () {
                    this.clickButtonCadastrar(context);
                  },
                  child: Button(
                    text: "Cadastrar-se",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clickButtonCadastrar(context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: CadastrarPage(),
      ),
    );
  }

  clickLogin(context) async {
    var parametros = {
      'email': emailInput.text.toString(),
      'password': passwordInput.text.toString()
    };

    Service.post('usuarioService/efetuarLogin/', parametros, context)
        .then((value) async {
      if (value != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('counter', value);
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(),
          ),
        );
      }
    });
  }

  validador(value, email) {
    if (isNull(value) || value.isEmpty) {
      return 'AVISO CAMPO NÃO PODE SER VAZIO';
    }

    if (email && (!isEmail(value))) {
      return "INFORME UM EMAIL VÁLIDO";
    }
  }
}
