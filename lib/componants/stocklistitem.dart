import 'package:flutter/material.dart';

class StockListItem extends StatelessWidget {
  const StockListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        // toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        title: Text(
          'Stock > ' + 'Product ID : 1001',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            height: 100.0,
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
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Product Name xeos",
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
                          "Vendor",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "Compny pvt. lmt.",
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
                          "Quantity",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "20",
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
                          "Purchase Prize",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$8000",
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
                          "Selling Prize",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$7000",
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
                          "Lowest Prize",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$6000",
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
                          "Discount",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "20%",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Edit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 156, 163, 157)),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: 300.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
