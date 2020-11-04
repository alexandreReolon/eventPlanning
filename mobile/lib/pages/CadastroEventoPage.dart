import 'dart:ui';
import 'package:eventPlanning/Service.dart' as Service;

import 'package:eventPlanning/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';

class CadastroEventoPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CadastroEventoPage> {
  final cadastrarPageKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();

  Widget cupertinoDate() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      minimumYear: 2025,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.dateAndTime,
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
      },
    );
  }

  ImagePicker _imagePicker = new ImagePicker();

  Future<PickedFile> _loadImage(ImageSource imageSource) async {
    PickedFile file = await _imagePicker.getImage(source: imageSource);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    final heightMedia = MediaQuery.of(context).copyWith().size.height / 3;

    return Scaffold(
      backgroundColor: CColors.BACKGROUND_COLOR,
      body: Form(
        key: cadastrarPageKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              FadeAnimation(
                1.2,
                Text(
                  "Cadastro de Eventos",
                  style: TextStyle(
                      fontSize: 40,
                      color: CColors.PRIMARY_COLOR,
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
                    color: CColors.PRIMARY_COLOR,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CColors.SECUNDARY_COLOR,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return validador(value, false);
                          },
                          controller: nameInput,
                          decoration: InputDecoration(
                            hintText: "Digite o nome do evento",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: CColors.SECUNDARY_COLOR.withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CColors.SECUNDARY_COLOR,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return validador(value, false);
                          },
                          controller: nameInput,
                          decoration: InputDecoration(
                            hintText: "Digite uma mensagem de divulgação",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: CColors.SECUNDARY_COLOR.withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: CColors.TERTIARY_COLOR,
                            ),
                            child: Center(
                              child: Text(
                                "SELECIONAR DATA",
                                style: TextStyle(
                                  color: CColors.PRIMARY_COLOR.withOpacity(.7),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext builder) {
                                  return Container(
                                      child: cupertinoDate(),
                                      height: heightMedia);
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: CColors.TERTIARY_COLOR,
                            ),
                            child: Center(
                              child: Text(
                                "ADICIONAR IMAGEM",
                                style: TextStyle(
                                  color: CColors.PRIMARY_COLOR.withOpacity(.7),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            _loadImage(ImageSource.gallery);
                          },
                        ),
                      )
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
                      this.clickSalvar();
                    },
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: CColors.SUCESS_COLOR.withOpacity(.7),
                      ),
                      child: Center(
                        child: Text(
                          "SALVAR",
                          style: TextStyle(
                            color: CColors.PRIMARY_COLOR.withOpacity(.7),
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

  clickSalvar() {
    if (cadastrarPageKey.currentState.validate()) {
      var parametros = {
        'name': nameInput.text.toString(),
        'email': emailInput.text.toString(),
        'password': passwordInput.text.toString()
      };

      var sucess = (json) {
        Navigator.pop(context);
      };

    Service.post('eventoService/adquirirEventos/', null, null);

    }
  }

  validador(value, email) {
    if (isNull(value) || value.isEmpty) {
      return 'AVISO CAMPO NÃO PODE SER VAZIO';
    }
  }
}
