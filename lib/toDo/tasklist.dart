import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fugipie_inventory/toDo/task.dart';
import '../provider/TodosModel.dart';
import './addnewtask.dart';

// DateTime now = DateTime.now();

class TaskList extends StatelessWidget {
  final List<Task>? tasks;

  TaskList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    final task = Provider.of<TodosModel>(context);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.only(
              top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF4A4A6D),
            ),
            child: ListTile(
              leading: Checkbox(
                // toggle the task as index item
                value: task.allTasks[index].completed,
                onChanged: ((_) => task.toggleTodo(task.allTasks[index])),
              ),
              //show all the task title
              title: Text(
                task.allTasks[index].title!,
                style: TextStyle(color: Colors.white),
              ),
              // subtitle: Text(now.toString()),
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red,
                ),
                child: IconButton(
                  onPressed: () {
                    //delete task as index item
                    task.deleteTodo(task.allTasks[index]);
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ))),
    );
  }
}
