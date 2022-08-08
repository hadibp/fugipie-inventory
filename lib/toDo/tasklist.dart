import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugipie_inventory/repository/database.dart';
import 'package:provider/provider.dart';
import 'package:fugipie_inventory/toDo/task.dart';
import '../modals/TodosModel.dart';

class TaskList extends StatelessWidget {
  var userid = FirebaseAuth.instance.currentUser?.uid;

  final TextEditingController _textEditingFieldController =
      TextEditingController();

  final CollectionReference _todolistfireref =
      FirebaseFirestore.instance.collection('todolist');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _todolistfireref
          .where('uid', isEqualTo: userid)
          // .orderBy('id', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
        if (_streamSnapshot.hasData) {
          return ListView.builder(
              itemCount: _streamSnapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final data = _streamSnapshot.data?.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 4.0, left: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF232333),
                    ),
                    child: ListTile(
                      title: Text(
                        data?['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                _update(context, data);
                              },
                              icon: const Icon(Icons.edit)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.red,
                            ),
                            child: IconButton(
                              onPressed: () {
                                _delete(context, data!.id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Container(
              child: Center(
                  child: Text(
            'todo list is empty',
            style: TextStyle(color: Colors.white),
          )));
        }
      },
    );
  }

  Future<void> _update(context, [DocumentSnapshot? data]) async {
    if (data != null) {
      _textEditingFieldController.text = data['title'];
    }
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit a new Task"),
            content: TextField(
              autofocus: true,
              controller: _textEditingFieldController,
              decoration: const InputDecoration(
                hintText: "Edit New Task",
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  final String title = _textEditingFieldController.text;
                  await _todolistfireref.doc(data!.id).update({'title': title});
                  print('value upadted');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("todo updated"),
                    ),
                  );
                  _textEditingFieldController.clear();
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
                child: const Text("Update"),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  Future<void> _delete(context, String productId) async {
    await _todolistfireref.doc(productId).delete();
    Fluttertoast.showToast(msg: 'todo deleted', gravity: ToastGravity.TOP);
  }
}
