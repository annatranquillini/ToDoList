import 'dart:async';

import 'package:flutter/material.dart';

import 'ToDo.dart';

class ToDoListTab extends StatefulWidget {
  final Future<List<ToDo>> future;
  ToDoListTab({this.future});

  @override
  _ToDoListTabState createState() => _ToDoListTabState();
}

class _ToDoListTabState extends State<ToDoListTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToDo>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, i) {
                bool val = snapshot.data[i].completed;
                return new ListTile(
                    title: Text(
                      snapshot.data[i].title,
                    ),
                    leading: Checkbox(
                      value: val,

                      onChanged: (value) {
                        setState(() {
                          val=value;
                        });
                      },
                    ));
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
      future: widget.future,
    );
  }
}
