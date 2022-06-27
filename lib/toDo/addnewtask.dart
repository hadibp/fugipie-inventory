import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/TodosModel.dart';
import './tasklist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';
  DateTime now = DateTime.now();

  //creating initState() for adding listener to controller
 @override
 void initState() {
   super.initState();
   _textFieldController.addListener(() {
     newTask = _textFieldController.text;
   });
 }

  //disposing the controller
 @override
 void dispose() {
   _textFieldController.dispose();
   super.dispose();
 }

  void _submit(now) {
    //we aren't interested in updating our ui so listen will be false
    Provider.of<TodosModel>(context, listen: false).addTodo(newTask);

    //cancelling the dialog
    Navigator.pop(context);
    // _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                onSubmitted: (_){
                    Provider.of<TodosModel>(context, listen: false)
                        .addTodo(newTask);

                    //cancelling the dialog
                    Navigator.of(context, rootNavigator: true).pop();
                  },
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<TodosModel>(context, listen: false)
                        .addTodo(newTask);

                    //cancelling the dialog
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text("Submit"),
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
    }

    return Scaffold(
      body: TaskList(),
//  floatingActionButton: FloatingActionButton(
//   onPressed: (() {
//    _showAddTextDialog();
//   }),
//  child: const Icon(Icons.add),
//  tooltip: "Add a todo",
//    ),
    );
  }
}
