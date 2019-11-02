import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Insert the new ToDo",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.supervised_user_circle),
              TextFormField(),
              FlatButton(
                child: Text("Insert"),
                onPressed: null,
              )
            ],
          ),
        ));
  }
}
