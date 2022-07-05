import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/provider/TodosModel.dart';
import 'package:provider/provider.dart';
import 'bloc/counter/counter_bloc.dart';

import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodosModel>(
          create: (context) => TodosModel(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class Somthingwentwrong extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("somthing went wrong")),
    );
  }
}
