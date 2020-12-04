import 'package:eventPlanning/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget field(
    {double paddingTop, String text, TextEditingController controller}) {
  return Padding(
    padding: EdgeInsets.only(top: paddingTop == null ? 15 : paddingTop),
    child: Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        cursorColor: CColors.COLOR_PRIMARY,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.black87.withOpacity(0.5)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget emailField({double paddingTop, TextEditingController controller}) {
  return Padding(
    padding: EdgeInsets.only(top: paddingTop == null ? 30 : paddingTop),
    child: Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        cursorColor: CColors.COLOR_PRIMARY,
        controller: controller,
        decoration: InputDecoration(
          hintText: "email@exemplo.com",
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.black87.withOpacity(0.5)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget passwordField({double paddingTop, TextEditingController controller}) {
  return Padding(
    padding: EdgeInsets.only(top: paddingTop == null ? 30 : paddingTop),
    child: Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        cursorColor: CColors.COLOR_PRIMARY,
        decoration: InputDecoration(
          hintText: "senha",
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.black87.withOpacity(0.5)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.only(
            top: 16.0,
            bottom: 16,
            left: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget loginButton({context, Function click}) {
  return Container(
    margin: EdgeInsets.only(top: 30.0),
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: RaisedButton(
      elevation: 0,
      highlightElevation: 10,
      color: CColors.COLOR_PRIMARY,
      highlightColor: CColors.COLOR_PRIMARY.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        "Entrar",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        click(context);
      },
    ),
  );
}

Widget cadastroButton({context, Function click}) {
  return Container(
    margin: EdgeInsets.only(bottom: 30, top: 10.0),
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: RaisedButton(
      elevation: 0,
      highlightElevation: 10,
      color: CColors.COLOR_SECUNDARY,
      highlightColor: CColors.COLOR_SECUNDARY.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        "Cadastrar-se",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        click(context);
      },
    ),
  );
}

Widget button({context, String text, Function click, Color cor}) {
  cor = cor != null ? cor : CColors.BACKGROUND_COLOR;

  return Container(
    margin: EdgeInsets.only(bottom: 10),
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: RaisedButton(
      elevation: 0,
      highlightElevation: 10,
      color: cor,
      highlightColor: cor.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        text,
        style: TextStyle(
          color: CColors.TEXT_COLOR,
        ),
      ),
      onPressed: () {
        click(context);
      },
    ),
  );
}
