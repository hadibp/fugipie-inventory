import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/bloc/auth/bloc/authapp_bloc.dart';
import 'package:fugipie_inventory/modals/usermodal.dart';
import 'package:fugipie_inventory/toDo/task.dart';
import 'package:fugipie_inventory/modals/TodosModel.dart';
import 'package:fugipie_inventory/componants/slider.dart';
import 'package:fugipie_inventory/componants/dropdown.dart';
import 'package:fugipie_inventory/toDo/tasklist.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';





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
  final _firebaseref = FirebaseFirestore.instance;
  final _firebaseauth = FirebaseAuth.instance;
  

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
    // Provider.of<TodosModel>(context, listen: false).addTodo(newTask);
    _textFieldController.clear();
    //cancelling the dialog
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthappBloc bloc) => bloc.state.user);
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
                onPressed: () {
                  context.read<AuthappBloc>().add(AppLogoutRequsted());
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  // CupertinoIcons.person_circle_fill,
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
                // CircleAvatar(
                //   radius: 50.0,
                //   backgroundImage: user.photo != null ? NetworkImage(user.photo!):null,
                //   child: user.photo==null? const Icon(Icons.circle_sharp):null,
                // )
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
                      heroTag: 'tag homebody',
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
              child: TaskList(
                  // tasks: todos.allTasks,

                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddTextDialog() async {
    final String uid;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
            title: const Text("Add a new Task"),
            content: TextField(
              controller: _textFieldController,
              autofocus: true,
              decoration: const InputDecoration(hintText: "Add New Task"),
              onSubmitted: (_) => _submit(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // context.read<TodosModel>().addTodo(Task(
                  //     createdTime: DateTime.now(),
                  // title: textController.text.toString()));
                  print(_textFieldController.text + " wordsss");
                  if (_textFieldController.text.isNotEmpty) {
                    _insertRecord(_textFieldController.text);


                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("values didnt inserted")));
                  }
                  _textFieldController.clear();
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
                child: const Text("Submit"),
              )
            ],
          );
        });
  }

  void _insertRecord(String title) {
    print("value :" + title);
    var userid = _firebaseauth.currentUser?.uid;
    // var id = 
    var uniqueId = _firebaseref.collection('todolist').doc().id;
    _firebaseref.collection('todolist').doc(uniqueId).set({
      'id': uniqueId,
      'title': title,
      'uid': userid,
    }).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Inserted values"),
            ),
          )
        });
    print(uniqueId);

     // with out id's----
    // firebaseref.collection('newtodotest').add({
    //   'title': title,
    // }).then((value) => {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text("Inserted Id : + ${value.id}"),
    //         ),
    //       )
    //     });
  }
}
