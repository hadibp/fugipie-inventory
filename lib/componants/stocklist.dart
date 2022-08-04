import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/stock/stock_bloc.dart';
import 'package:fugipie_inventory/componants/datepicker.dart';
import 'package:fugipie_inventory/componants/servises/serviseitem.dart';
import 'package:fugipie_inventory/componants/stocklistitem.dart';
import 'package:fugipie_inventory/screens/stock.dart';
import 'package:intl/intl.dart';

import '../bloc/counter/counter_bloc.dart';

class StockList extends StatefulWidget {
  StockList({Key? key}) : super(key: key);

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  String searchid = '';

  final CollectionReference _todolistfireref =
      FirebaseFirestore.instance.collection('stocklist');

  // var userid = FirebaseAuth.instance.currentUser?.uid;

  TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StockLoading) {
          print('the state count is ${state.props.length}');
          return Center(child: CircularProgressIndicator());
        }

        if (state is StockLoaded) {
          final count = state.products.length;
          if (state.products.isNotEmpty) {
            return Scaffold(
              backgroundColor: Color(0xff181826),
              appBar: AppBar(
                toolbarHeight: 70.0,
                backgroundColor: Color(0xff181826),
                title: const Text(
                  'Stock',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, top: 15.0, bottom: 15.0),
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
                                controller: _searchcontroller,
                                enabled: true,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.search,
                                    color: Color(0xFF707091),
                                  ),
                                  iconColor: Colors.white,
                                  hintText: 'search product id',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF707091)),
                                  fillColor: Color(0xFF707091),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchid = value;
                                  });
                                  print(value);
                                },
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
                        heroTag: 'tag stock',
                        backgroundColor: Colors.blueAccent,
                        onPressed: (() async {
                          DateTime date = DateTime.now();
                          await bottomModal(context, date);
                        }),
                        child: Icon(
                          Icons.add,
                          size: 35.0,
                          color: Color(0xFF232338),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: count,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final data = state.products[index];

                    final docid = data.id;
                    if (searchid.isEmpty) {
                      return Center(
                          child: ListTile(
                        title: Center(
                            child: Container(
                          height: 270.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF232333),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  left: 18.0,
                                  right: 18.0,
                                  bottom: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '11-02-2022',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Product id : ${data.id}',
                                    style: TextStyle(color: Colors.white),
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
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
                                        "${data.productname}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Vendor",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data.vendor}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Quantity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data.quantity}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: GestureDetector(
                                  child: const Text(
                                    'More > ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    print(docid);
                                    // final dataq =
                                    //     _streamSnapshot.data?.docs[index];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StockListItem(context, data)),
                                    );
                                  }),
                            )
                          ]),
                        )),
                      ));
                    } else if (data.id
                        .toString()
                        .startsWith(searchid.toLowerCase())) {
                      return Center(
                          child: ListTile(
                        title: Center(
                            child: Container(
                          height: 270.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF232333),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  left: 18.0,
                                  right: 18.0,
                                  bottom: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '11-02-2022',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Product id : ${data.id}',
                                    style: TextStyle(color: Colors.white),
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
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
                                        "${data.productname}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Vendor",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data.vendor}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 10.0),
                              height: 40.0,
                              width: 400.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Quantity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data.quantity}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: GestureDetector(
                                  child: const Text(
                                    'More > ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    print(docid);
                                    final dataq = state.products[index];
                                    //     _streamSnapshot.data?.docs[index];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StockListItem(context, dataq),
                                      ),
                                    );
                                  }),
                            )
                          ]),
                        )),
                      ));
                    } else {
                      return Container();
                    }
                  }),
            );
          } else {
            return StockPage();
          }
        } else {
          return const Text('something went wrong');
        }
      },
    );
  }

  bottomModal(BuildContext context, DateTime date) async {
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
                    decoration:const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.grey,
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder:  OutlineInputBorder(
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
                      // Timestamp date = Timestamp.fromDate(date)
                      // ;

                      _insertstokRecord(_id, date, _name, _vendor, quantity,
                          purchaseprize, lowestprize, discount);

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
      },
    );
  }
}

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );

final _firebaseref = FirebaseFirestore.instance;
final _firebaseauth = FirebaseAuth.instance;

TextEditingController _productidcontroller = TextEditingController();
TextEditingController _datecontroller = TextEditingController();
TextEditingController _productnamecontroller = TextEditingController();
TextEditingController _vendorcontroller = TextEditingController();
TextEditingController _quatitycontroller = TextEditingController();
TextEditingController _purchaseprizecontroller = TextEditingController();
TextEditingController _sellingprizecontroller = TextEditingController();
TextEditingController _discountcontroller = TextEditingController();

void _insertstokRecord(
    id, date, name, vendor, quantity, purchaseprize, sellingprize, discount) {
  var userid = _firebaseauth.currentUser?.uid;

  var uniqueId = _firebaseref.collection('stocklist').doc().id;
  _firebaseref.collection('stocklist').doc(uniqueId).set({
    'uid': userid,
    'id': id,
    'date': date,
    'name': name,
    'vendor': vendor,
    'quantity': quantity,
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
