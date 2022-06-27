import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2A2A43),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Table(
                children: <TableRow>[
                  TableRow(children: [
                    Container(
                      color: Colors.white,
                      child: Text('hello'),
                    ),
                    Container(
                      color: Colors.white,
                      child: Text('world'),
    
                    ),
                    Container(
                      color: Colors.white,
                      child: Text('welcome'),
    
                    ),
                  ])
                ],
              ),
              Center(
                child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  onPressed: (() {}),
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
      ),
    );
  }
}
