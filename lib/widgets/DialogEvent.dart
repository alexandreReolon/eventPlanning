import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eventPlanning/service.dart' as Service;

Widget dialogEvent(
    {Map<String, dynamic> map, BuildContext context, String usuario}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                map['TITULO'],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Gostaria de participar desse evento?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Ao clicar em participar, seu chekin já estará garantido!",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        "Fechar",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Participar",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        registerParticipation(map, usuario, context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: SvgPicture.asset("assets/images/confirmed.svg")),
          ),
        ),
      ],
    ),
  );
}

registerParticipation(map, usuario, context) {
  Map<String, dynamic> dadosUsuario = jsonDecode(usuario);

  var codigoUsuario = dadosUsuario['codigoUsuario'];

  if (map == null || map['CODIGO'] == null || codigoUsuario == null) {
    return;
  }

  var parameters = {
    'codigoEvento': map['CODIGO'],
    'codigoUsuario': codigoUsuario
  };

  Service.post('eventoService/registrarParticipacao/', parameters, null)
      .then((value) async {
    if (value != null) {
        Navigator.of(context).pop();
    }
  });
}
