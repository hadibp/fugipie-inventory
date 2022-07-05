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
          initialIndex: 0,
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
                  margin: EdgeInsets.only(top: 5.0),
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
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:35.0,top: 5.0),
                      child: Text('4 results',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                Container(
                  child: Expanded(
                    child: TabBarView(
                      children: [
                      _tabOne(),
                      _tabTwo(),
                      _tabThree(),
                    ]),
                  ),
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


Widget _tabOne(){
  return Container(
    padding: EdgeInsets.all(2.0),
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (
          context,
          index,
        ) {
          return Center(
              child: ListTile(
            title: Center(
                child: Container(
              // height: 250.0,
              width: 400.0,
              decoration: BoxDecoration(
                  color: Color(0xFF3E3E5C),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 18.0, right: 18.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '11-02-2022',
                        style: TextStyle(color: Colors.white,fontSize: 14.0),
                      ),
                      Text(
                        'Product id : 10011',
                        style: TextStyle(color: Colors.white,fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2.0,
                  thickness: 3.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Neon xe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                          softWrap: true,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vendor",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "company pvt. limtd",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "purchase prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selling Prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Divider(
                  height: 5.0,
                  thickness: 5.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total prize paid",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$18000",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ]),
            )),
          ));
        }),
  );
}

Widget _tabTwo(){
  return Container(
    padding: EdgeInsets.all(2.0),
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (
          context,
          index,
        ) {
          return Center(
              child: ListTile(
            title: Center(
                child: Container(
              // height: 250.0,
              width: 400.0,
              decoration: BoxDecoration(
                  color: Color(0xFF3E3E5C),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 18.0, right: 18.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '11-02-2022',
                        style: TextStyle(color: Colors.white,fontSize: 14.0),
                      ),
                      Text(
                        'Product id : 10011',
                        style: TextStyle(color: Colors.white,fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2.0,
                  thickness: 3.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Neon xe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                          softWrap: true,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vendor",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "company pvt. limtd",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "purchase prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selling Prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lowest Prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selling Prize",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "20%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "Aquibe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        "9876543210",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Divider(
                  height: 5.0,
                  thickness: 5.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total prize",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$18000",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ]),
            )),
          ));
        }),
  );
}

Widget _tabThree(){
  return Container(
    padding: EdgeInsets.all(2.0),
    child: ListView.builder(
        itemCount: 4,
        itemBuilder: (
          context,
          index,
        ) {
          return Center(
              child: ListTile(
            title: Center(
                child: Container(
              // height: 250.0,
              width: 400.0,
              decoration: BoxDecoration(
                  color: Color(0xFF3E3E5C),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0,  right: 18.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Issue id : 10011',
                        style: TextStyle(color: Colors.white,fontSize:15.0),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2.0,
                  thickness: 3.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                 Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "02/07/2022",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                          softWrap: true,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Isuue",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Broken Display",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                          softWrap: true,
                        ),
                      ]),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Aquibe",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "9876543210",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 15.0, right: 35.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Completed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 0, 0)),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5.0,
                  thickness: 5.0,
                  color: Color.fromARGB(255, 78, 78, 78),
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service Charge",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "8000",
                          style: TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ]),
            )),
          ));
        }),
  );
}