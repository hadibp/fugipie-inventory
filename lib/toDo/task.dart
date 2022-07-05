import 'package:flutter/material.dart';

class Task {
  String? id;
  String? title;
  bool completed;

  Task({@required this.title, this.completed = false});

  
}