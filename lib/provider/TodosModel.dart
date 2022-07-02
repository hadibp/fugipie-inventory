import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:fugipie_inventory/toDo/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'helo world'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    Task(title: 'helo world 2'),
    // Task(title: 'helo world 2'),
    // Task(title: 'helo world 2'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void addTodo(String task) {
    _tasks.add(Task(title: task, completed: false));
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
