import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/DataModels/Colors.dart';
import 'package:to_do_list/DataModels/ToDo.dart';
import 'package:to_do_list/Bloc/ToDo/ToDo.dart';

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
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoading) {
          BlocProvider.of<TodosBloc>(context)
              .add(LoadTodos());
          return Center(child: CircularProgressIndicator());
        }
        if (state is TodosLoaded) {
          return ListView.builder(
              itemCount: state.todos == null ? 0 : state.todos.length + 1,
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
                              BlocProvider.of<TodosBloc>(context)
                                  .add(AddTodo(todo));

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
                          state.todos[i - 1].title,
                        ),
                        leading: Checkbox(
                          value: state.todos[i - 1].completed,
                          onChanged: (value) {
                            ToDo todo=state.todos[i - 1];
                            BlocProvider.of<TodosBloc>(context)
                                .add(ToggleTodo(todo));

                            setState(() {});
                          },
                        ));
              });
        }
        if (state is TodosNotLoaded) {
          return Center(child: Text("Connection Error"));
        }

        return Center(child: Text("Connection Error"));
      },
    );
  }
}
