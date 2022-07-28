import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showError(BuildContext context,String text){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('An Error Occured'),
      content: Text(text),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('ok'))
      ],

    );
  });
}