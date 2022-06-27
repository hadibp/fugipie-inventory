import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fugipie_inventory/provider/TodosModel.dart';
import 'package:fugipie_inventory/componants/slider.dart';
import 'package:fugipie_inventory/componants/dropdown.dart';
import 'package:fugipie_inventory/toDo/tasklist.dart';
import 'package:flutter/cupertino.dart';

class HomePageBody extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final _listitem = ['one', 'two', 'three', 'four', 'details/month'];

  final List<String> imgList = ['1', '2', '3', '4'];

  final _textFieldController = TextEditingController();

  String newTask = '';

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

  void _submit() {
    //we aren't interested in updating our ui so listen will be false
    Provider.of<TodosModel>(context, listen: false).addTodo(newTask);
    _textFieldController.clear();
    //cancelling the dialog
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff181826),
        elevation: 5.0,
        toolbarHeight: 80.0,
        title: Image.asset('assets/images/fugipielogo.png', fit: BoxFit.cover),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.person_circle_fill,
                  size: 50.0,
                )),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF232338),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: dropdowndate(listitem: _listitem),
                ),
              ],
            ),
            carouselslider(imgList: imgList),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Todo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.blueAccent,
                      onPressed: (() {
                        _showAddTextDialog();
                      }),
                      child: Icon(
                        Icons.add,
                        size: 40.0,
                        color: Color(0xFF232338),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Consumer<TodosModel>(
                  builder: (context, todos, child) => TaskList(
                    tasks: todos.allTasks,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              onSubmitted: (_) => _submit(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<TodosModel>(context, listen: false)
                      .addTodo(newTask);
                  _textFieldController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Submit"),
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }
}
