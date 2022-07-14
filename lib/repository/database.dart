import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fugipie_inventory/toDo/task.dart';

import '../config/utils.dart';


class FirebaseApi {
  static Future<String> createTodo(Task todo) async {
    final docId = FirebaseFirestore.instance.collection("Todos").doc();
    todo.id = docId.id;
    await docId.set(todo.toJson());
    return docId.id;
  }
}

class DatbaseServices{
  final String? uid;
  DatbaseServices({this.uid});
  final CollectionReference _ref = FirebaseFirestore.instance.collection('newTodos');



  
}
