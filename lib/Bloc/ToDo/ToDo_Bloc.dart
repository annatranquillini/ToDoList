import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:to_do_list/DataModels/DataModels.dart' ;
import 'package:to_do_list/Bloc/ToDo/ToDo.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc();

  @override
  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    } else if (event is ToggleTodo) {
      yield* _mapToggleTodoToState(event);
    }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    try {
      final todos = await fetchToDos();
      yield TodosLoaded(
        todos,
      );
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

  Stream<TodosState> _mapAddTodoToState(AddTodo event) async* {
    if (state is TodosLoaded) {
      final List<ToDo> updatedTodos = List.from((state as TodosLoaded).todos)
        ..insert(0, event.todo);
      yield TodosLoaded(updatedTodos);
      event.todo.post();
    }
  }

  Stream<TodosState> _mapToggleTodoToState(ToggleTodo event) async* {
    if (state is TodosLoaded) {
      ToDo todo = event.todo;
      todo.completed = !todo.completed;
      todo.patch();
    }
  }





}
