import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/model/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>>
{
  TodoCubit() : super([]);

  void addTodo(String title)
  {
    if(title.isEmpty)
      {
        addError("Title is empty");
        return;
      }
    final todo= TodoModel(name: title, createdAt: DateTime.now());
    state.add(todo);
    emit([...state]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print("Todo Cubit - $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}