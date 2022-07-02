import 'package:flutter/material.dart';
import 'package:fugipie_inventory/componants/stocklistitem.dart';

class StockList extends StatelessWidget {
  StockList({Key? key}) : super(key: key);

  final List = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        title: Text(
          'Stock',
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
              width: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: FloatingActionButton(
                heroTag: 'hero1',
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.add,
                  size: 35.0,
                  color: Color(0xFF232338),
                ),
                onPressed: (() {
                  _stockbottommodal(context);
                }),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: List.length,
          itemBuilder: (
            context,
            index,
          ) {
            return Center(
                child: ListTile(
              title: Center(
                  child: Container(
                height: 270.0,
                width: 400.0,
                decoration: BoxDecoration(
                    color: Color(0xFF3E3E5C),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '11-02-2022',
                          style: TextStyle(color: Colors.white),
                        ),
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
                    margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                    height: 40.0,
                    width: 400.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Name",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "Product Name xeos",
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
                              "Vendor",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "Compny pvt. lmt.",
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
                    margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                    height: 40.0,
                    width: 400.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GestureDetector(
                        child: Text(
                          'More >',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StockListItem()),
                          );
                        }),
                  )
                ]),
              )),
            ));
          }),
    );
  }
}



void _stockbottommodal(context) {
  
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
          initialChildSize: 0.9,
          builder: (_, controller) => Container(
            color: Color(0xFF232338),
            child: ListView(
              controller: controller,
              padding: EdgeInsets.all(32),
              children: [
                buildText('Date'),
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
                buildText('Product Id'),
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
                buildText('Product Name'),
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
                buildText('Vendor'),
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
                buildText('Quantitiy'),
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
                buildText('Parchase Prize'),
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
                buildText('Selling Price'),
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
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('close'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 171, 47, 47),
                        
                      ),
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
