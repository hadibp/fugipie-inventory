import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/repository/database.dart';
import 'package:provider/provider.dart';
import 'package:fugipie_inventory/toDo/task.dart';
import '../provider/TodosModel.dart';


class TaskList extends StatelessWidget {
  final List<Task>? tasks;

  TaskList({@required this.tasks});

  final TextEditingController _textEditingFieldController = TextEditingController();

  final CollectionReference _todolistfireref =
      FirebaseFirestore.instance.collection('newtodotest');


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _todolistfireref.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          
          return ListView.builder(
              itemCount: streamSnapshot.data?.docs.length,
              
              itemBuilder: (context, index) {
                final DocumentSnapshot data = streamSnapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 4.0, left: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF4A4A6D),
                    ),
                    child:
                        // return
                        ListTile(
                      title: Text(
                        data['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit a new Task"),
                                        content: TextField(
                                          //  _textEditingFieldController.text  =data['name'];
                                          autofocus: true,
                                          controller:
                                              _textEditingFieldController,
                                          decoration: const InputDecoration(
                                              hintText: "Edit New Task",
                                              ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: ()async {
                                              // var temptext = Task(
                                              //     createdTime:
                                              //         DateTime.now(),
                                              //     title:
                                              //         _textEditingFieldController
                                              //             .text);
                                              // // temptext.id = value.tasks[index].id;
                                              // context
                                              //     .read<TodosModel>()
                                              //     .updateTodo(temptext);
   

                                              final String name = _textEditingFieldController.text;
                                              if(data != null){
                                               await _todolistfireref.doc()
                                              }
                                              _textEditingFieldController
                                                  .clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Update"),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(120, 40)),
                                          )
                                        ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                      );
                                    });
                              },
                              icon:const Icon(Icons.edit)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.red,
                            ),
                            child: IconButton(
                              onPressed: () {},
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
          return Text('not found');
        }
      },
    );



    //   return ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: false,
    //     itemCount: 2,
    //     // snapshot.data!.size,
    //     itemBuilder: ((context, index) => Padding(
    //           padding: const EdgeInsets.only(
    //               top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10.0),
    //               color: Color(0xFF4A4A6D),
    //             ),
    //             child: ListTile(
    //               title: Text(
    //                 'hello-jj',
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               trailing: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   IconButton(
    //                       onPressed: () {
    //                         showDialog(
    //                             context: context,
    //                             builder: (context) {
    //                               return AlertDialog(
    //                                 // backgroundColor: Colors.black87,
    //                                 title: const Text("Edit a new Task"),
    //                                 content: TextField(
    //                                   autofocus: true,
    //                                   controller: _textEditingFieldController,
    //                                   decoration: const InputDecoration(
    //                                       hintText: "Edit New Task"),
    //                                 ),
    //                                 actions: [
    //                                   ElevatedButton(
    //                                     onPressed: () {
    //                                       // var temptext = Task(
    //                                       //     createdTime:
    //                                       //         DateTime.now(),
    //                                       //     title:
    //                                       //         _textEditingFieldController
    //                                       //             .text);
    //                                       // // temptext.id = value.tasks[index].id;
    //                                       // context
    //                                       //     .read<TodosModel>()
    //                                       //     .updateTodo(temptext);
    //                                       // _textEditingFieldController
    //                                       //     .clear();
    //                                       Navigator.pop(context);
    //                                     },
    //                                     child: const Text("Update"),
    //                                     style: ElevatedButton.styleFrom(
    //                                         minimumSize: const Size(120, 40)),
    //                                   )
    //                                 ],
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(16),
    //                                 ),
    //                                 actionsAlignment: MainAxisAlignment.center,
    //                               );
    //                             });
    //                       },
    //                       icon: Icon(Icons.edit)),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(30.0),
    //                       color: Colors.red,
    //                     ),
    //                     child: IconButton(
    //                       onPressed: () {},
    //                       icon: const Icon(
    //                         Icons.delete,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         )),
    //   );
  }
}
Future <void> _update  ([DocumentSnapshot documentSnapshot]) aysnc {
  if (documentSnapshot != null){
   final _textEditingFieldController.text = data['name'];
    
  }
}