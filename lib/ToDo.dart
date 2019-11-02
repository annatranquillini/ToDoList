class ToDo {
  String title;
  bool completed;

  ToDo({
    this.title,
    this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
