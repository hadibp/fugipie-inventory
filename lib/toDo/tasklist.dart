import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fugipie_inventory/toDo/task.dart';
import '../provider/TodosModel.dart';

// DateTime now = DateTime.now();

class TaskList extends StatelessWidget {
  final List<Task>? tasks;

  TaskList({@required this.tasks});

  final _textEditingFieldController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    // final task = Provider.of<TodosModel>(context);

    return Consumer<TodosModel>(
      builder: (context, value, child) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: value.tasks.length,
        itemBuilder: ((context, index) => Padding(
            padding: const EdgeInsets.only(
                top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF4A4A6D),
              ),
              child: ListTile(
                title: Text(
                  value.tasks[index].title.toString(),
                  // task.allTasks[index].title!,
                  style: TextStyle(color: Colors.white),
                ),
                // subtitle: Text(now.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          print( value.tasks.length);
                          // _showEditTextDialog(context);
                          TextEditingController(text: value.tasks[index].title);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // backgroundColor: Colors.black87,
                                  title: const Text("Edit a new Task"),
                                  content: TextField(
                                    autofocus: true,
                                    controller: _textEditingFieldController,

                                    decoration: const InputDecoration(
                                        hintText: "Edit New Task"),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        var temptext = Task(
                                            title: _textEditingFieldController
                                                .text);
                                        temptext.id = value.tasks[index].id;
                                        context
                                            .read<TodosModel>()
                                            .updateTodo(temptext);
                                        _textEditingFieldController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Update"),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(120, 40)),
                                    )
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                );
                              });
                        },
                        icon: Icon(Icons.edit)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.red,
                      ),
                      child: IconButton(
                        onPressed: () {
                          // delete task as index item
                          context
                              .read<TodosModel>()
                              .deleteTodo(value.tasks[index].id);
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
            ))),
      ),
    );
  }
}

// Future<void> _showEditTextDialog(context) async {
//   final _textEditingFieldController = TextEditingController();

//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.black87,
//           title: const Text("Add a new Task"),
//           content: TextField(
//             autofocus: true,
//             controller: _textEditingFieldController,
//             decoration: const InputDecoration(hintText: "Edit New Task"),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 var temptext = Task(title: _textEditingFieldController.text);
//                 temptext.id = value.tasks[index].id.context
//                     .read<TodosModel>()
//                     .updateTodo(temptext);
//                 _textEditingFieldController.clear();
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//               style: ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
//             )
//           ],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//         );
//       });
// }
