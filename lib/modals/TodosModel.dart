import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fugipie_inventory/repository/database.dart';
import 'package:fugipie_inventory/toDo/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> tasks = [];

  // void addTodo(Task todo) => FirebaseApi.createTodo(todo);

  void updateTodo(Task todo) async {
    var index = tasks.indexWhere((element) => element.id == todo.id);

    notifyListeners();
  }

  void deleteTodo(id) async {
    var index = tasks.indexWhere((element) => element.id == id);

    notifyListeners();
  }
}
