import 'package:flutter/material.dart';

import '../componants/servises/serviseitem.dart';

class ServicePage extends StatelessWidget {
  TabController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 33),
      appBar: AppBar(
        title: Text('Servises'),
        backgroundColor: Color(0xFF202034),
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
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      isScrollable: false,
                      tabs: [
                        Tab(child: Text('Add a service', softWrap: false)),
                        Tab(
                            child: Text(
                          'To be returned',
                          softWrap: false,
                        )),
                        Tab(child: Text('Bag')),
                      ]),
                ),
                Expanded(
                  child: TabBarView(children: [
                    tabOne(context),
                    tabTwo(),
                    tabThree(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



void _servicebottommodal(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      elevation: 2.0,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          builder: (_, controller) => Container(
            color: Color(0xFF232338),
            child: ListView(
              controller: controller,
              padding: EdgeInsets.all(32),
              children: [
                buildText('Issue Id'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    prefixIcon: Icon(
                      Icons.date_range_rounded,
                      color: Colors.white,
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Return Date'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Service charge'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Name'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Phone'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('close'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 171, 47, 47),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );

Widget tabOne(context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 150.0),
      child: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: (() {
          _servicebottommodal(context);
        }),
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Color(0xFF232338),
        ),
      ),
    ),
  );
}

Widget tabTwo() {
  return Container(
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: Container(
          //  height: 40.0,
          child: TextField(
            enabled: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(top: 5.0, bottom: 10.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255), width: 2.0),
                borderRadius: BorderRadius.circular(40.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255), width: 2.0),
                borderRadius: BorderRadius.circular(40.0),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF707091),
              ),
              iconColor: Colors.white,
              hintText: 'search product id',
              hintStyle: TextStyle(color: Color(0xFF707091)),
              filled: true,
              fillColor: Color.fromARGB(255, 55, 55, 90),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
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
                    height: 340.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF3E3E5C),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Product id : 10011',
                              style: TextStyle(color: Colors.white),
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
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 108, 159),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin:
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Return Date",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "23-08-2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 108, 159),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin:
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          ),
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 108, 159),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin:
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 108, 159),
                            borderRadius: BorderRadius.circular(10.0)),
                        margin:
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Service Charge",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "\$8000",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20.0, right: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "OnProgress",
                              style: TextStyle(color: Colors.white),
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                            child: Text(
                              'More >',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServiceItem()),
                              );
                            }),
                      )
                    ]),
                  )),
                ));
              }),
        ),
      ),
    ]),
  );
}

Widget tabThree() {
  return Container(
    child: Expanded(
      child: Container(
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
                  height: 250.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF3E3E5C),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Issue id : 10011',
                            style: TextStyle(color: Colors.white),
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
                          left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
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
                          left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
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
                          top: 15.0, left: 15.0, right: 35.0, bottom: 20.0),
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
                          left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
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
      ),
    ),
  );
}
