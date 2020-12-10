import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:eventPlanning/Service.dart' as Service;

import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/pages/MenuBottom.dart';
import 'package:eventPlanning/utils/login_form_fields.dart';
import 'package:eventPlanning/widgets/CustomDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/animations/FadeAnimation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:string_validator/string_validator.dart';

class CadastroEventoPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CadastroEventoPage> {
  final cadastrarPageKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController mensagemInput = TextEditingController();

  DateTime dataInput = new DateTime.now();
  String base64Image;
  int beacons = CBeacon.AZUL;

  Widget cupertinoDate() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      minimumYear: 2025,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.dateAndTime,
      onDateTimeChanged: (DateTime newdate) {
        dataInput = newdate;
      },
    );
  }

  ImagePicker _imagePicker = new ImagePicker();

  _loadImage(ImageSource imageSource) async {
    PickedFile file = await _imagePicker.getImage(source: imageSource);

    File imageFile = new File(file.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    base64Image = base64Encode(imageBytes).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.BACKGROUND_COLOR_DARK,
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
                  "Eventos",
                  style: TextStyle(
                    fontSize: 40,
                    color: CColors.TEXT_COLOR,
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
                    color: Color(0xff01405F),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: field(
                            text: "Nome do Evento", controller: nameInput),
                      ),
                      Container(
                        child: field(
                            text: "Mensagem para o Evento",
                            controller: mensagemInput),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                          hint: 'hint',
                          errorText: '',
                          value: beacons,
                          items: [
                            DropdownMenuItem(
                              value: CBeacon.AZUL,
                              child: Text('Beacon Azul'),
                            ),
                            DropdownMenuItem(
                              value: CBeacon.BRANCO,
                              child: Text('Beacon Branco'),
                            ),
                          ].cast<DropdownMenuItem<int>>(),
                          onChanged: (value) {
                            setState(() {
                              beacons = value;
                            });
                          }),
                      button(context: context, text: "Data", click: clickDia),
                      SizedBox(
                        height: 10,
                      ),
                      button(
                          context: context, text: "Imagem", click: clickImagem),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              FadeAnimation(
                  1.8,
                  button(
                      context: context,
                      text: "Salvar",
                      click: clickSalvar,
                      cor: CColors.COLOR_PRIMARY)),
            ],
          ),
        ),
      ),
    );
  }

  clickImagem(context) {
    _loadImage(ImageSource.gallery);
  }

  clickDia(context) {
    final heightMedia = MediaQuery.of(context).copyWith().size.height / 3;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            child: cupertinoDate(),
            height: heightMedia,
          );
        });
  }

  clickSalvar(context) {
    var parametros = {
      'titulo': nameInput.text.toString(),
      'dataInicio': dataInput.toString(),
      'imagem': base64Image,
      'mensagem': mensagemInput.text.toString(),
      'beacon': beacons,
    };

    print(parametros);

    Service.post('eventoService/salvarEventos/', parametros, context)
        .then((value) async {
      if (value != null) {
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

  validador(value, email) {
    if (isNull(value) || value.isEmpty) {
      return 'AVISO CAMPO NÃO PODE SER VAZIO';
    }
  }
}
