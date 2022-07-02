import 'package:flutter/material.dart';
import 'package:fugipie_inventory/componants/sales/salesitem.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A43),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        elevation: 6,
        title: Text(
          'Sales Orders',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 10.0, top: 15.0, bottom: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF2A2A45),
              ),
              height: 100.0,
              width: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        onTap: (() {
                          _salesbottommodal(context);
                        }),
                        enabled: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xFF707091),
                          ),
                          iconColor: Colors.white,
                          hintText: 'search product id',
                          hintStyle: TextStyle(color: Color(0xFF707091)),
                          fillColor: Color(0xFF707091),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Enter product id to checkout!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void _salesbottommodal(context) {
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
                buildText('Product Id'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Product Name'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Vendor'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Quantity'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130.0,
                        child: const TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                            ),
                          ),
                          cursorHeight: 30,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          toolbarOptions: ToolbarOptions(selectAll: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 164, 194, 15),
                            ),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.exposure_minus_1),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 15, 171),
                          ),
                        ),
                      ),
                    ]),
                buildText('selling price'),
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
                buildText('lowest price'),
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
                buildText('Discount'),
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
                  padding: const EdgeInsets.all(14.0),
                  child: Center(
                    child: Text(
                      '-----     \$42000    -----',
                      style: TextStyle(color: Colors.grey, fontSize: 28.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SalesItem()),
                          );
                        },
                  child: Text('Add Item'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel Item'),
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
