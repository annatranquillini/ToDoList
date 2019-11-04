import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/ToDo/ToDo.dart';
import 'Bloc/Profile/Profile.dart';
import 'DataModels/Colors.dart';

import 'Tabs/ProfileTab.dart';
import 'Tabs/toToListTab.dart';

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
      home: MyHomePage(
        title: 'ToDo ',
      ),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.check),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              child: ToDoListTab(),
              builder: (BuildContext context) => TodosBloc(),
            ),
            BlocProvider(
              child: ProfileTab(),
              builder: (BuildContext context) => ProfileBloc(),
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
