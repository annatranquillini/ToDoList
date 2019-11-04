import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:equatable/equatable.dart';


class ToDo extends Equatable {
   int id;
  final String title;
   bool completed;

  ToDo({
    this.id,
    this.title,
    this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // 'id': id.toString(),
      'title': title ?? '',
      'completed': completed.toString(),
    };
  }

  patch() async {
    String URL = 'https://jsonplaceholder.typicode.com/todos/' + id.toString();
    print(this.toJson()..addAll({'id': id.toString()}));
    final response = await http.patch(URL,
        body: this.toJson()..addAll({'id': id.toString()}));
    if (response.statusCode == 200) {
      //Scaffold.of(context).showSnackBar(SnackBar(content: Text("done", style: TextStyle(color: Colors.black),)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to patch ToDo');
    }

    return;
  }

  post() async {
    String URL = 'https://jsonplaceholder.typicode.com/todos/';
    print(this.toJson());
    final response = await http.post(URL, body: this.toJson());
    if (response.statusCode == 201) {
      final parsed = json.decode(response.body);
      this.id = parsed['id'] as int;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to post new Todo');
    }

    return;
  }



  @override
  List<Object> get props => [id];
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