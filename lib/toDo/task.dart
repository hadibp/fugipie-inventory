import 'package:flutter/material.dart';

class TodoField {
  static const createdTime = 'created time';
}

class Task {
  DateTime createTime;
  String? id;
  String? title;
  bool completed;

  Task(
      {required this.createTime,
      this.id,
      @required this.title,
      this.completed = false});

  static Task fromjson(Map<String, dynamic> json) => Task(
        createTime: json['createTime'],
        title: json['title'],
        id: json['id'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'createTime': DateTime.now(),
        'title': title,
        'id': id,
        'completed': completed,
      };
}
