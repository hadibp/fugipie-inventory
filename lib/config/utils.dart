

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';


class Utils{
  static DateTime toDateTime(Timestamp value){
    if(value==null ) return DateTime.now();

    return value.toDate();
  }
  static dynamic fromDatetimetoJson(DateTime date){
    // if(date == null ) return DateTime.now().toUtc();

    return date.toUtc();
  }








//   static StreamTransformer transformer<T>(
//           T Function(Map<String, dynamic> json) fromJson) =>
//       StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
//         handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
//           final snaps = data.docs.map((doc) => doc.data()).toList();
//           final objects = snaps.map((json) => fromJson(json)).toList();

//           sink.add(objects);
//         },
//       );
}