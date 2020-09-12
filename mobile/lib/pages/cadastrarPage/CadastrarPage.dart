import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/Service.dart' as Service;
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:string_validator/string_validator.dart';

class CadastrarPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CadastrarPage> {
  final cadastrar_page_key = GlobalKey<FormState>();

  TextEditingController name_input = TextEditingController();
  TextEditingController password_input = TextEditingController();
  TextEditingController email_input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Form(
        key: cadastrar_page_key,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(
                1.2,
                Text(
                  "Cadastro",
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
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'AVISO';
                            }
                          },
                          controller: name_input,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: SECUNDARY_COLOR.withOpacity(.8),
                              ),
                              hintText: "Digite seu nome"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: SECUNDARY_COLOR[300]),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'AVISO';
                            }

                            if (!isEmail(value)) {
                              return 'INFORME UM EMAIL VÁLIDO';
                            }
                          },
                          controller: email_input,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'AVISO';
                            }
                          },
                          controller: password_input,
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
                      this.clickButtonCadastro();
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
                          "CADASTRAR",
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
      ),
    );
  }

  clickButtonCadastro() {
    if (cadastrar_page_key.currentState.validate()) {
      var parametros = {
        'name': name_input.text.toString(),
        'email': email_input.text.toString(),
        'password': password_input.text.toString()
      };

      var response =
          Service.post('usuarioService/cadastrarUsuario/', parametros, context);

      if (response == null) {
        return false;
      }

      //Volta a tela de login
      Navigator.pop(context);
    }
  }
}
