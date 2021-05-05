import 'package:eventPlanning/constants.dart';
import 'package:eventPlanning/models/Event.dart';
import 'package:eventPlanning/utils/login_form_fields.dart';
import 'package:eventPlanning/widgets/StarRating.dart';
import 'package:flutter/material.dart';
import 'package:eventPlanning/service.dart' as Service;

class FeedbackPage extends StatefulWidget {
  final Map<String, dynamic> dadosUsuario;

  FeedbackPage({Key key, this.dadosUsuario}) : super(key: key);

  _FeedbackPage createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  Future<List<Event>> eventos;

  int _pergunta1 = 1;
  int _pergunta2 = 1;
  double _pergunta3 = 3;
  TextEditingController _pergunta4 = TextEditingController();

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    setState(() {
      eventos = Service.getEvento(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 18.0,
      color: CColors.TEXT_COLOR,
      fontWeight: FontWeight.bold,
    );

    return Container(
      child: Scaffold(
        backgroundColor: CColors.BACKGROUND_COLOR_DARK,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  getToolbar(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Text(
                            "1) Você prefere utilizar os métodos tradicionais ( filas ) ou prefere utilizar o aplicativo Event Planning para realizar os seus chekins nos eventos?",
                            textAlign: TextAlign.justify,
                            style: textStyle),
                      ),
                    ),
                  ),
                  Theme(
                      data: ThemeData.dark(),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              activeColor: CColors.COLOR_PRIMARY,
                              groupValue: _pergunta1,
                              onChanged: (value) {
                                setState(() {
                                  _pergunta1 = value;
                                });
                              },
                            ),
                            Text(
                              "Event Planning",
                              textAlign: TextAlign.justify,
                              style: textStyle,
                            ),
                            Radio(
                              value: 2,
                              activeColor: CColors.COLOR_PRIMARY,
                              groupValue: _pergunta1,
                              onChanged: (value) {
                                setState(() {
                                  _pergunta1 = value;
                                });
                              },
                            ),
                            Text(
                              "Lista",
                              textAlign: TextAlign.justify,
                              style: textStyle,
                            ),
                          ])),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Text(
                          "2) O aplicativo Event Planning facilitou o uso e diminuiu o tempo em chekins para os eventos participados?",
                          textAlign: TextAlign.justify,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                  Theme(
                      data: ThemeData.dark(),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              activeColor: CColors.COLOR_PRIMARY,
                              groupValue: _pergunta2,
                              onChanged: (value) {
                                setState(() {
                                  _pergunta2 = value;
                                });
                              },
                            ),
                            Text(
                              "Sim",
                              textAlign: TextAlign.justify,
                              style: textStyle,
                            ),
                            Radio(
                              value: 2,
                              activeColor: CColors.COLOR_PRIMARY,
                              groupValue: _pergunta2,
                              onChanged: (value) {
                                setState(() {
                                  _pergunta2 = value;
                                });
                              },
                            ),
                            Text(
                              "Nao",
                              textAlign: TextAlign.justify,
                              style: textStyle,
                            ),
                          ])),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Text(
                          "3)De uma nota de um  a cinco, como você classificaria o aplicativo? sendo cinco a nota mais alta e um a nota mais baixa.",
                          textAlign: TextAlign.justify,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StarRating(
                    rating: _pergunta3,
                    onRatingChanged: (rating) =>
                        setState(() => this._pergunta3 = rating),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Text(
                              "4) Gostaria de deixar uma sugestão ou melhoria?",
                              textAlign: TextAlign.justify,
                              style: textStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: CColors.COLOR_PRIMARY, // set border color
                          width: 3.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: TextFormField(
                      maxLength: 255,
                      controller: _pergunta4,
                      keyboardType: TextInputType.multiline,
                      decoration:
                          InputDecoration(hintText: 'Deixe uma sugestao'),
                    ),
                  ),
                  button(
                    context: context,
                    text: "Salvar respostas",
                    click: clickSalvar,
                    cor: CColors.COLOR_PRIMARY,
                    width: MediaQuery.of(context).size.width - 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Image.asset('assets/images/feedback.png', scale: 2),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  clickSalvar(context) {
    var parametros = {
      'pergunta01': _pergunta1,
      'pergunta02': _pergunta2,
      'pergunta03': _pergunta3,
      'pergunta04': _pergunta4.text.toString(),
      'codigoUsuario': widget.dadosUsuario['codigoUsuario']
    };

    Service.post('feedbackservice/atualizarfeedback/', parametros, context);
  }
}
