import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import '../bloc/counter/counter_bloc.dart';

class StockPage extends StatelessWidget {
  StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        backgroundColor: Color(0xff181826),
        title: Text(
          'Stock',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.add,
            size: 40.0,
            color: Color(0xFF232338),
          ),
          onPressed: (() {
            _stockbottommodal(context);
          }),
        ),
      ),
    );
  }
}

final _firebaseref = FirebaseFirestore.instance;
final _firebaseauth = FirebaseAuth.instance;

TextEditingController _datecontroller = TextEditingController();
TextEditingController _productidcontroller = TextEditingController();
TextEditingController _productnamecontroller = TextEditingController();
TextEditingController _vendorcontroller = TextEditingController();
TextEditingController _quatitycontroller = TextEditingController();
TextEditingController _purchaseprizecontroller = TextEditingController();
TextEditingController _sellingprizecontroller = TextEditingController();
TextEditingController _discountcontroller = TextEditingController();

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
                buildText('Product Id'),
                TextField(
                  controller: _productidcontroller,
                  decoration: const InputDecoration(
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
                buildText('Date'),
                TextField(
                  controller: _datecontroller,
                  decoration: const InputDecoration(
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
                buildText('Product Name'),
                TextField(
                  controller: _productnamecontroller,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: _vendorcontroller,
                  decoration: const InputDecoration(
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
                        width: 150.0,
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            _quatitycontroller.text =
                                state.counterValue.toString();
                            return TextField(
                              controller: _quatitycontroller,
                              decoration: const InputDecoration(
                                // hintText: state.counterValue.toString(),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                contentPadding: EdgeInsets.all(10.0),
                                filled: true,
                                fillColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 2, 2, 2),
                                      width: 2.0),
                                ),
                              ),
                              cursorHeight: 30,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              toolbarOptions: ToolbarOptions(selectAll: true),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 164, 194, 15),
                          ),
                        ),
                        onPressed: () =>
                            context.read<CounterBloc>().add(DecrementEvent()),
                        child: Icon(Icons.exposure_minus_1),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<CounterBloc>().add(IncrementEvent()),
                        child: Icon(Icons.add),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 15, 171),
                          ),
                        ),
                      ),
                    ]),
                buildText('Purchase Prize'),
                TextField(
                  controller: _purchaseprizecontroller,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: _sellingprizecontroller,
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
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Discount'),
                TextField(
                  controller: _discountcontroller,
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
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    final _id = _productidcontroller.text;
                    final _date = _datecontroller.text;
                    final _name = _productnamecontroller.text;
                    final _vendor = _vendorcontroller.text;
                    final _quantity = _quatitycontroller.text;
                    final _purchaseprize = _purchaseprizecontroller.text;
                    final _sellingprize = _sellingprizecontroller.text;
                    final _discount = _discountcontroller.text;

                    if (_id.isNotEmpty &&
                        _date.isNotEmpty &&
                        _name.isNotEmpty &&
                        _vendor.isNotEmpty &&
                        _quantity.isNotEmpty &&
                        _purchaseprize.isNotEmpty &&
                        _sellingprize.isNotEmpty &&
                        _discount.isNotEmpty) {
                      _insertstokRecord(_id, _date, _name, _vendor, _quantity,
                          _purchaseprize, _sellingprize, _discount);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("fill all the textfields")));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text('submit'),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 171, 47, 47),
                    ),
                  ),
                  child: Text('close'),
                )
              ],
            ),
          ),
        );
      });
}

Widget buildText(String text) => Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );

void _insertstokRecord(  id, name, date, vendor, quantity, purchaseprize, sellingprize, discount) {
  print(id +
      name +
      date +
      vendor +
      quantity +
      purchaseprize +
      sellingprize +
      discount);
  var userid = _firebaseauth.currentUser?.uid;

  var uniqueId = _firebaseref.collection('stocklist').doc().id;
  _firebaseref.collection('stocklist').doc(uniqueId).set({
    'id': id,
    'uid': userid,
    'name': name,
    'vendor': vendor,
    'quantitiy': quantity,
    'purchaseprize': purchaseprize,
    'sellingprize': sellingprize,
    'discound': discount,
  });
  // .then((value) => {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Inserted values"),
  //         ),
  //       )
  //     });
  print(uniqueId);
}
