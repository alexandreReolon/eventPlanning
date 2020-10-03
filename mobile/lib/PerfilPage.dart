import 'package:eventPlanning/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SECUNDARY_COLOR,
        title: Text(
          "Perfil Page",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/usuario.png'),
              ),
              Text(
                'NOME',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: TEXTO_COLOR,
                  fontSize: 25,
                ),
              ),
              Text(
                'Ben vindo',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: TEXTO_COLOR,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile()),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
