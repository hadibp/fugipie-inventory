
import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        backgroundColor: Color(0xff181826),
        title: Text(
          'Stock',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.add,
            size: 40.0,
            color: Color(0xFF232338),
          ),
          onPressed: (() {}),
        ),
      ),
    );
  }
}
