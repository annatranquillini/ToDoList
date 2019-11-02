import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/toToListTab.dart';

import 'Colors.dart';
import 'ProfileTab.dart';
import 'ToDo.dart';
import 'User.dart';


int uId = 1;
String baseURL = "https://jsonplaceholder.typicode.com";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: colorTheme,
      home: MyHomePage(title: 'ToDo '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<User> user;
  Future<List<ToDo>> todos;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
    todos = fetchToDos();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "ToDo List", icon: Icon(Icons.check_box)),
              Tab(text: "Profile", icon: Icon(Icons.supervised_user_circle)),
            ],
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: TabBarView(
          children: [ToDoListTab(future: todos), profileTab(user)],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

Future<User> fetchUser() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/users/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return User.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<List<ToDo>> fetchToDos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/todos?userId=1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var data = json.decode(response.body) as List;

    return data.map<ToDo>((json) => ToDo.fromJson(json)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

