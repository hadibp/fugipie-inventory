import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import '../bloc/counter/counter_bloc.dart';

class StockPage extends StatefulWidget {
  StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        backgroundColor: Color(0xff181826),
        title: const Text(
          'Stock',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: (() async {
            DateTime date = DateTime.now();
            await _bottommodal(context, date);
          }),
          child: const Icon(
            Icons.add,
            size: 40.0,
            color: Color(0xFF232338),
          ),
        ),
      ),
    );
  }

  _bottommodal(BuildContext context, DateTime date) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      elevation: 2.0,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          builder: (_, controllers) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            color: Color(0xFF232338),
            child: ListView(
              controller: controllers,
              padding: EdgeInsets.all(32),
              children: [
                buildText('Product Id'),
                TextField(
                  controller: _productidcontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 5),
                        lastDate: DateTime(DateTime.now().year + 5));
                    DatePickerEntryMode initialEntryMode =
                        DatePickerEntryMode.calendar;
                    if (selectedDate == null) return;
                    if (selectedDate != null) {
                      setState(() {
                        date = selectedDate;
                      });
                    }

                    _datecontroller.text =
                        '${date.day}/${date.month}/${date.year}';

                    print('date picked + ');
                  },
                  child: TextField(
                    controller: _datecontroller,
                    keyboardType: TextInputType.datetime,
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
                      enabled: false,
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
                ),
                buildText('Product Name'),
                TextField(
                  controller: _productnamecontroller,
                  onChanged: (String text) {
                    text = _productnamecontroller.text;
                    print(text);
                  },
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
                TextField(
                  controller: _quatitycontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    // hintText: state.counterValue.toString(),
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 2, 2, 2), width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Purchase Prize'),
                TextField(
                  controller: _purchaseprizecontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
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
                    // final _date = _datecontroller.text;
                    final _name = _productnamecontroller.text;
                    final _vendor = _vendorcontroller.text;
                    final _quantity = _quatitycontroller.text;
                    final _purchaseprize = _purchaseprizecontroller.text;
                    final _sellingprize = _sellingprizecontroller.text;
                    final _discount = _discountcontroller.text;

                    if (_id.isNotEmpty &&
                        _name.isNotEmpty &&
                        _vendor.isNotEmpty &&
                        _quantity.isNotEmpty &&
                        _purchaseprize.isNotEmpty &&
                        _sellingprize.isNotEmpty &&
                        _discount.isNotEmpty) {
                      double quantity = double.parse(_quantity);
                      double purchaseprize = double.parse(_purchaseprize);
                      double lowestprize = double.parse(_sellingprize);
                      double discount = double.parse(_discount);
                      // DateTime storingdate = DateTime.parse(_date);
                      // Timestamp date = Timestamp.fromDate(date);

                      _insertstokRecord(_id, date, _name, _vendor, quantity,
                          purchaseprize, lowestprize, discount);

                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showToast(
                          msg: 'fill all the text fields',
                          gravity: ToastGravity.BOTTOM);
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
      },
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

Widget buildText(String text) => Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );

void _insertstokRecord(
    id, date, name, vendor, quantity, purchaseprize, sellingprize, discount) {
  var userId = _firebaseauth.currentUser?.uid;

  var docId = _firebaseref.collection('stocklist').doc().id;
  _firebaseref.collection('stocklist').doc(docId).set({
    'docId': docId,
    'userId': userId,
    'productid': id,
    'date': date,
    'name': name,
    'vendor': vendor,
    'quantity': quantity,
    'purchaseprize': purchaseprize,
    'sellingprize': sellingprize,
    'discound': discount,
  }).then((value) => {
        Fluttertoast.showToast(
            msg: 'value inserted succefully', gravity: ToastGravity.TOP),
      });
  print(docId);
}
