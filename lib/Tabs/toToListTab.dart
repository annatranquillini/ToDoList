import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list/DataModels/Colors.dart';
import 'package:to_do_list/DataModels/ToDo.dart';



class ToDoListTab extends StatefulWidget {
  final Future<List<ToDo>> future;
  ToDoListTab({this.future});

  @override
  _ToDoListTabState createState() => _ToDoListTabState();
}

class _ToDoListTabState extends State<ToDoListTab> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToDo>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length + 1,
              itemBuilder: (BuildContext context, i) {
                return i == 0
                    ? ListTile(
                        title: Form(
                          key: this._formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Insert a value';
                              } else
                                return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '...',
                            ),
                            onSaved: (value) {
                              ToDo todo =
                                  ToDo(title: value, completed: false, id: 1);
                              snapshot.data.insert(0,todo);
                              todo.post();
                              setState(() {});
                            },
                          ),
                        ),
                        leading: Checkbox(
                          value: false,
                          onChanged: null,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: CustomColors.blueTiffany,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _formKey.currentState.reset();
                            }
                          },
                        ),
                      )
                    : ListTile(
                        title: Text(
                          snapshot.data[i - 1].title,
                        ),
                        leading: Checkbox(
                          value: snapshot.data[i - 1].completed,
                          onChanged: (value) {
                            snapshot.data[i - 1].completed = value;
                            ToDo todo = snapshot.data[i - 1];
                            todo.patch();

                            setState(() {});
                          },
                        ));
              });
        } else if (snapshot.hasError) {
          return Center(child: Text("Connection Error"));
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
      future: widget.future,
    );
  }
}
