import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 18, 33),
        appBar: AppBar(
          // toolbarHeight: 70.0,
          backgroundColor: Color(0xff181826),
          title: Text(
            'Servise > ' + 'Product ID : 1001',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: Container(
          height: 500.0,
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
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 108, 159),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              height: 40.0,
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Return Date",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      Text(
                        "23-08-2022",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 108, 159),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
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
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
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
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              height: 40.0,
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      Text(
                        "Aquibe",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 108, 159),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              height: 40.0,
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      Text(
                        "9800890799",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 108, 159),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              height: 40.0,
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service Charge",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      Text(
                        "\$8000",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Container(
                // padding: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 40.0),
                height: 50.0,
                width: 400.0,
                color: Colors.blueAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // color: Colors.black,
                        child: Text('Completed'),
                      ),
                      Container(
                        child: Text('onProgress'),
                      ),
                    ]),
              ),
            ),
            TextButton(
              onPressed: (() {
                _editbottommodal(context);
              }),
              child: Text('Edit'),
              // style: ButtonStyle(
              //  backgroundColor: Colors.blueGrey,
              // ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Add to bag'),
              // style: ButtonStyle(
              //  backgroundColor: Colors.blueGrey,
              // ),
            )
          ]),
        ));
  }
}

void _editbottommodal(context) {
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
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                  child: Container(
                    // padding: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 40.0),
                    height: 50.0,
                    width: 400.0,
                    color: Colors.blueAccent,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // color: Colors.black,
                            child: Text('Completed'),
                          ),
                          Container(
                            child: Text('onProgress'),
                          ),
                        ]),
                  ),
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
