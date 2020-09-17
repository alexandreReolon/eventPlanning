import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/Service.dart' as Service;
import 'package:string_validator/string_validator.dart';

class CadastrarPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CadastrarPage> {
  final cadastrarPageKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECUNDARY_COLOR,
      body: Form(
        key: cadastrarPageKey,
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
                    color: PRIMARY_COLOR,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: SECUNDARY_COLOR,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return validador(value, false);
                          },
                          controller: nameInput,
                          decoration: InputDecoration(
                            hintText: "Digite seu nome",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: SECUNDARY_COLOR.withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: SECUNDARY_COLOR),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return validador(value, true);
                          },
                          controller: emailInput,
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
                          controller: passwordInput,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.8),
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
                      this.clickButtonCadastro();
                    },
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: TERTIARY_COLOR,
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
    if (cadastrarPageKey.currentState.validate()) {
      var parametros = {
        'name': nameInput.text.toString(),
        'email': emailInput.text.toString(),
        'password': passwordInput.text.toString()
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

  validador(value, email) {
    if (isNull(value) || value.isEmpty) {
      return 'AVISO CAMPO NÃO PODE SER VAZIO';
    }

    if (email && (isEmail(value))) {
      return "INFORME UM EMAIL VÁLIDO";
    }
  }
}