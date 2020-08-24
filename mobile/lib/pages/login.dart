import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/beacon.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter)),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "ENTRARs",
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Text("REGISTRAR-SE",
                              style: Theme.of(context).textTheme.button),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(Icons.alternate_email,
                                color: primaryColor),
                          ),
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(hintText: "EMAIL")),
                          )
                        ],
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
