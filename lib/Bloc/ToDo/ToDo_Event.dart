import 'package:equatable/equatable.dart';
import 'package:to_do_list/DataModels/ToDo.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final ToDo todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class ToggleTodo extends TodosEvent {
  final ToDo todo;

  const ToggleTodo(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'ToggleTodo { todo: $todo }';
}


