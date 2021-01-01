import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/utils/login_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:eventPlanning/service.dart' as Service;

class CadastrarPage extends StatefulWidget {
  CadastrarPage({Key key}) : super(key: key);

  _CadastrarPageState createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  final cadastrarPageKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se '),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double paddingTop = 20;

          if (constraints.constrainHeight() <= 300) {
            paddingTop = 5;
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
                        child: cadastrarText(),
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
                                field(
                                  text: "Nome",
                                  paddingTop: paddingTop,
                                  controller: nameInput,
                                ),
                                emailField(
                                  paddingTop: 10,
                                  controller: emailInput,
                                ),
                                passwordField(
                                  paddingTop: 10,
                                  controller: passwordInput,
                                ),
                                cadastroButton(
                                    context: context,
                                    click: clickButtonCadastro)
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

  Widget cadastrarText() {
    return FadeAnimation(
      1.8,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  Text("Preencha os campos abaixo para realizar o seu cadastro",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CColors.TEXT_COLOR,
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ),
        ],
      ),
    );
  }

  clickButtonCadastro(parametro) {
    var parametros = {
      'name': nameInput.text,
      'email': emailInput.text,
      'password': passwordInput.text
    };

    Service.post('usuarioService/cadastrarUsuario/', parametros, context)
        .then((value) async {
      if (value != null) {
        Navigator.pop(context);
      }
    });
  }
}
