import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDo {
  int id;
  String title;
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

  put() async {
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
}
