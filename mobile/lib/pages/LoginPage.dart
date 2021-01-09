import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/CadastrarPage.dart';
import 'package:eventPlanning/pages/MenuBottom.dart';
import 'package:eventPlanning/utils/login_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eventPlanning/service.dart' as Service;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double paddingTopEmailField = 50;

          if (constraints.constrainHeight() <= 300) {
            paddingTopEmailField = 5;
          }

          return Stack(
            children: <Widget>[
              FlareActor(
                "assets/animations/flow.flr",
                animation: "flow",
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: loginText(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FadeAnimation(
                        2.0,
                        Container(
                          child: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                emailField(
                                    paddingTop: paddingTopEmailField,
                                    controller: emailFieldController),
                                passwordField(
                                    paddingTop: 10,
                                    controller: passwordFieldController),
                                loginButton(
                                  context: context,
                                  click: clickLogin,
                                ),
                                cadastroButton(
                                    context: context,
                                    click: clickButtonCadastrar)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget loginText() {
    return FadeAnimation(
      1.8,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Bem Vindo,",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: CColors.TEXT_COLOR,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Text(
            "Faça o login para continuar",
            style: TextStyle(
              fontSize: 18.0,
              color: CColors.TEXT_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  clickLogin(context) async {
    var parametros = {
      'email': emailFieldController.text.toString(),
      'password': passwordFieldController.text.toString()
    };

    Service.post('usuarioService/efetuarLogin/', parametros, context)
        .then((value) async {
      if (value != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('usuario', value);

        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: MenuBottom(),
          ),
        );
      }
    });
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
}
