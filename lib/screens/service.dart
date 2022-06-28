import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  TabController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A43),
      appBar: AppBar(
        title: Text('Servises'),
        backgroundColor: Color(0xFF2A2A43),
        elevation: 0.0,
      ),
      body: Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  width: 300.0,
                  height: 40.0,
                  margin: EdgeInsets.only(top: 25.0),
                  child: TabBar(
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      isScrollable: false,
                      tabs: [
                        Tab(child: Text('Add a service',softWrap:false)),
                        Tab(child: Text('To be returned',softWrap: false,)),
                        Tab(child: Text('Bag')),
                      ]),
                ),
                Expanded(
                  child: TabBarView(children: [
                    Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150.0),
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
                ),
                    Center(
                      child: Text('wold'),
                    ),
                    Center(
                      child: Text('wold'),
                    ),
                  ]),
                ),

                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 150.0),
                //     child: FloatingActionButton(
                //       backgroundColor: Colors.blueAccent,
                //       onPressed: (() {}),
                //       child: Icon(
                //         Icons.add,
                //         size: 40.0,
                //         color: Color(0xFF232338),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
