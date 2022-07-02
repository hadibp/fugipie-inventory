import 'package:flutter/material.dart';

import 'package:fugipie_inventory/componants/datepicker.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TabController? _controller;

  DateTime toselectedDate = DateTime.now();
  DateTime fromselectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A43),
      appBar: AppBar(
        title: Text('History'),
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
                  width: 350.0,
                  height: 40.0,
                  margin: EdgeInsets.only(top: 25.0),
                  child: TabBar(
                      controller: _controller,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      isScrollable: false,
                      tabs: [
                        Tab(child: Text('stock')),
                        Tab(child: Text('sales')),
                        Tab(child: Text('service')),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(
                    height: 40.0,
                    width: 350.0,
                    color: Color.fromARGB(255, 56, 67, 76),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.grey,
                                  backgroundColor: Colors.black26),
                              onPressed: () {
                                fromselectDate(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined),
                                  Text(
                                    '    ${fromselectedDate.year}/${fromselectedDate.month}/${fromselectedDate.day}        ',
                                  ),
                                ],
                              )),
                        ]),
                        Text('To',style: TextStyle(color:Colors.white),),
                        Row(children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.grey,
                                  backgroundColor: Colors.black26),
                              onPressed: () {
                                toselectDate(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month_outlined),
                                  Text(
                                    '    ${toselectedDate.year}/${toselectedDate.month}/${toselectedDate.day}        ',
                                  ),
                                ],
                              )),
                        ]),
                      ],
                    ),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }





  fromselectDate(BuildContext context) async {
    final DateTime? fromselected = await showDatePicker(
      context: context,
      initialDate: toselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (fromselected != null && fromselected != fromselectedDate) {
      setState(() {
        fromselectedDate = fromselected;
      });
    }
  }

  toselectDate(BuildContext context) async {
    final DateTime? toselected = await showDatePicker(
      context: context,
      initialDate: toselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (toselected != null && toselected != toselectedDate) {
      setState(() {
        toselectedDate = toselected;
      });
    }
  }
}
