import 'package:flutter/material.dart';

int x = 8;

double s = 0.1 * 0.1;

int i = 1;

class SalesItem extends StatelessWidget {
  const SalesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        title: Text(
          'Sales orders',
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
              width: 130.0,
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
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: x,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return ListTile(
                      title: Center(
                          child: Container(
                        height: 270.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF3E3E5C),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 18.0,
                                  right: 18.0,
                                  bottom: 5.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Product id : 1001 $i',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.right,
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
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "Product Name xeos",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Vendor",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "Compny pvt. lmt.",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Quantity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "20",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Purchase Prize",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "5000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Selling Prize",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "7000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Lowest Prize",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "7000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "20%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
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
                                    left: 15.0, right: 15.0, bottom: 10.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "6000",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ]),
                      )),
                    );
                  }),
            ),
          ),
          Container(
            height: 80.0,
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'items(2)',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Grand Total',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      '\$42000',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 300.0,
            height: 35.0,
            child: ElevatedButton(
              onPressed: () {
                _whatsappmodal(context);
              },
              //  () => Navigator.of(context).pop(),
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 300.0,
            height: 35.0,
            child: ElevatedButton(
              onPressed: () {},
              //  () => Navigator.of(context).pop(),
              child: Text('cancel'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 220, 82, 72),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _whatsappmodal(context) {
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 33, 41, 72),
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children:[ Column(
            children: [
              buildText('Customer Name'),
              Padding(
                padding: const EdgeInsets.only(left:40.0,right: 40.0),
                child: TextField(
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
                ),
              ),
              buildText('phone'),
              Padding(
                padding: const EdgeInsets.only(left:40.0,right: 40.0),
                child: TextField(
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
                ),
              ),
              SizedBox(
                width: 320.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.whatsapp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesItem()),
                    );
                  },
                  label: Text('Send Bill',
        
                  
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              SizedBox(
                width: 320.0,
        
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Save Bill'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 171, 47, 47),
                    ),
                  ),
                ),
              )
            ],
          ),]
        );
      });
}

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey,
            
            ),
      textAlign: TextAlign.left,      
      ),
    );
