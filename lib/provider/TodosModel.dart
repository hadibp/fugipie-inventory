import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fugipie_inventory/toDo/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> tasks = []; 

  final firestore = FirebaseFirestore.instance.collection("Todos").doc();

  

  void addTodo(Task todo) async {
    todo.id=firestore.id;
    // await firestore.set(todo

    // add({
    //   "title": todo.title,
    // }).then((value) {
    //   todo.id = value.id;
    // });

    tasks.add(todo);
    notifyListeners();
  }

  void updateTodo(Task todo) async {
    var index = tasks.indexWhere((element) => element.id == todo.id);

    if (index != -1) {
      await firestore
          .collection("Todos")
          .doc(todo.id)
          .update({"title": todo.title});
      tasks[index] = todo;
    }
    ;

    notifyListeners();
  }

  void deleteTodo(id) async {
    var index = tasks.indexWhere((element) => element.id == id);

    if (index != -1) {
      await firestore.collection("Todos").doc(id).delete();
      tasks.removeAt(index);
    }
    ;

    notifyListeners();
  }
}

// void updateTodo(Task task){
//   final taskIndex = _tasks.indexOf(task);
//     _tasks[taskIndex].toggleCompleted();
// }
