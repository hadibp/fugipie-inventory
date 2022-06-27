import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/provider/TodosModel.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'toDo/addnewtask.dart';

void main() {
  runApp(ChangeNotifierProvider<TodosModel>(
          create: (context) =>TodosModel(),
          child: MyApp()

  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage());
  }
}
