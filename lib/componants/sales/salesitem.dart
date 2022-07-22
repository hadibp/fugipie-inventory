import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/screens/sales.dart';
import 'package:url_launcher/url_launcher.dart';

final CollectionReference _stocklistfireref =
    FirebaseFirestore.instance.collection('stocklist');
var userid = FirebaseAuth.instance.currentUser?.uid;

void sendtowhatsapp({@required mobnumber, @required name}) async {
  Uri url = Uri.parse('whatsapp://send?phone=$mobnumber&text=$name');
  await canLaunchUrl(url) ? launchUrl(url) : print('can\'t open whatsapp');
}

// double grandtotal=0.0;
class SalesItem extends StatelessWidget {
  SalesItem(context, this.data);
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        title: const Text(
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
                children: const [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Color(0xFF707091),
                          ),
                          iconColor: Colors.white,
                          hintText: 'search product',
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
      body: StreamBuilder<QuerySnapshot>(
          stream: _stocklistfireref
              .doc(userid)
              .collection('cart-collection')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
            var itemCount = _streamSnapshot.data?.docs.length;

            if (_streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_streamSnapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _streamSnapshot.data?.docs.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            final DocumentSnapshot data =
                                _streamSnapshot.data!.docs[index];

                            return ListTile(
                              title: Center(
                                  child: Container(
                                height: 270.0,
                                width: 400.0,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF3E3E5C),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5.0,
                                          left: 18.0,
                                          right: 10.0,
                                          bottom: 0.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Product id : ${data['id']}',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.left,
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              alignment: Alignment.topRight,
                                              onPressed: () {
                                                _deleteitem(context, data.id);
                                              },
                                              splashColor: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
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
                                              const Text(
                                                "Product Name",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0),
                                              ),
                                              Text(
                                                data['name'],
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
                                                data['vendor'],
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
                                                data['quantity'].toString(),
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
                                              const Text(
                                                "Purchase Prize",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0),
                                              ),
                                              Text(
                                                data['purchaseprize'],
                                                style: const TextStyle(
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
                                              const Text(
                                                "Selling Prize",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0),
                                              ),
                                              Text(
                                                data['sellingprize'],
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
                                              const Text(
                                                "Discount",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0),
                                              ),
                                              Text(
                                                data['discound'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 13.0),
                                              ),
                                            ]),
                                      ),
                                      const Divider(
                                        height: 2.0,
                                        thickness: 3.0,
                                        color: Color.fromARGB(255, 78, 78, 78),
                                        indent: 18.0,
                                        endIndent: 18.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Total",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0),
                                              ),
                                              Text(
                                                data['total'].toString(),
                                                style: const TextStyle(
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
                                _streamSnapshot.hasData
                                    ? 'items(${itemCount.toString()})'
                                    : '0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                                textAlign: TextAlign.left,
                              ),
                              const Text(
                                'Grand Total :',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              _streamSnapshot.hasData
                                  ? '\$ grandtotal}'
                                  : '\$grandtotal',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
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
                        print('grandtotal');
                      },
                      //  () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 300.0,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 220, 82, 72),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Text('the Cart is empty',
                  style: TextStyle(color: Colors.white));
            }
          }),
    );
  }
}

TextEditingController _mobphonecontroller = TextEditingController();
TextEditingController _custamernamecontroller = TextEditingController();

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
        return Wrap(children: [
          Column(
            children: [
              buildText('Customer Name'),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: TextField(
                  controller: _custamernamecontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              buildText('phone'),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: TextField(
                  controller: _mobphonecontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(
                width: 320.0,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.whatsapp),
                  onPressed: () {
                    final whatsappnum = _mobphonecontroller.text;
                    final custname = _custamernamecontroller.text;

                    sendtowhatsapp(mobnumber: whatsappnum, name: custname);
                  },
                  label: const Text(
                    'Send Bill',
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
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
          ),
        ]);
      });
}

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.grey,
        ),
        textAlign: TextAlign.left,
      ),
    );

Future<void> _deleteitem(context, String productId) async {
  await _stocklistfireref
      .doc(userid)
      .collection('cart-collection')
      .doc(productId)
      .delete();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("removed from cart"),
    ),
  );
}
