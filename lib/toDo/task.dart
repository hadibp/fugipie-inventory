import 'package:flutter/material.dart';

import '../config/utils.dart';

class TodoField {
  static const createdTime = 'created time';
}

class Task {
  DateTime createdTime;
  String? id;
  String? title;
  bool completed;

  Task(
      {required this.createdTime,
      this.id,
      @required this.title,
      this.completed = false});

  static Task fromjson(Map<String, dynamic> json) => Task(
        createdTime: Utils.toDateTime(json['createTime']),
        title: json['title'], 
        id: json['id'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'createTime': Utils.fromDatetimetoJson(createdTime),
        'title': title,
        'id': id,
        'completed': completed,
      };
}
