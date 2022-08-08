import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugipie_inventory/bloc/stock/stock_bloc.dart';
import 'package:fugipie_inventory/componants/sales/salesitem.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import 'package:fugipie_inventory/modals/cartmodal.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
import 'package:fugipie_inventory/screens/stock.dart';
import 'package:intl/intl.dart';

import '../bloc/counter/counter_bloc.dart';

final CollectionReference _stockistfireref =
    FirebaseFirestore.instance.collection('stocklist');

class StockListItem extends StatefulWidget {
  StockListItem(context, this.data);

  final SalesProducts data;

  @override
  State<StockListItem> createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  @override
  Widget build(BuildContext context) {
    // final SalesProducts data = widget.datas ;

    return Scaffold(
      backgroundColor: Color(0xff181826),
      appBar: AppBar(
        backgroundColor: Color(0xff181826),
        title: Text(
          'Stock > Product ID : ${widget.data.id}',
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            height: 100.0,
            width: 400.0,
            decoration: BoxDecoration(
                color: Color(0xFF181826),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd-MM-yyy')
                          .format(widget.data.date?.toDate() ?? DateTime.now()),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Product id : ${widget.data.id}',
                      style: const TextStyle(color: Colors.white),
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
                margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                height: 40.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product Name",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          " ${widget.data.productname}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF373748),
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
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
                        const Text(
                          "Vendor",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "${widget.data.vendor}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF373748),
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                height: 40.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Quantity",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "${widget.data.quantity}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF373748),
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                height: 40.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Purchase Prize",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "${widget.data.purchaseprize} ",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF373748),
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                height: 40.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Lowest Prize",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "\$ ${widget.data.lowestprize}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF373748),
                    borderRadius: BorderRadius.circular(10.0)),
                margin:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                height: 40.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                        Text(
                          "${widget.data.discount} %",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13.0),
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () async {
                    print(widget.data.id);
                    DateTime date = DateTime.now();

                    await await _updatestockitem(context, date);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF666666)),
                  ),
                  child: const Text('Edit'),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: 300.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {
                    _delete(context, widget.data);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Delete'),
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }

  _updatestockitem(BuildContext context, DateTime date) async {
    if (widget.data != null) {
      _productidcontroller.text = widget.data.id.toString();
      _datecontroller.text = DateFormat('dd-MM-yyy')
          .format(widget.data.date?.toDate() ?? DateTime.now())
          .toString();
      _productnamecontroller.text = widget.data.productname.toString();
      _vendorcontroller.text = widget.data.vendor.toString();
      _quatitycontroller.text = widget.data.quantity.toString();
      _purchaseprizecontroller.text = widget.data.purchaseprize.toString();
      _sellingprizecontroller.text = widget.data.lowestprize.toString();
      _discountcontroller.text = widget.data.discount.toString();
    }
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
                    DateTime date = DateTime.now();

                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 5),
                        lastDate: DateTime(DateTime.now().year + 5));
                    DatePickerEntryMode initialEntryMode =
                        DatePickerEntryMode.calendar;
                    if (selectedDate == null) return;
                    setState(() {
                      date = selectedDate;
                    });
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

                      print(widget.data.docId);
                      _stockistfireref.doc(widget.data.docId).update({
                        'productid': _id,
                        'date': date,
                        'name': _name,
                        'vendor': _vendor,
                        'quantity': quantity,
                        'purchaseprize': purchaseprize,
                        'sellingprize': lowestprize,
                        'discound': discount
                      }).then((value) => Fluttertoast.showToast(
                          msg: 'value updated succefully',
                          gravity: ToastGravity.TOP));
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

Widget buildText(String text) => Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );

TextEditingController _productidcontroller = TextEditingController();
TextEditingController _datecontroller = TextEditingController();
TextEditingController _productnamecontroller = TextEditingController();
TextEditingController _vendorcontroller = TextEditingController();
TextEditingController _quatitycontroller = TextEditingController();
TextEditingController _purchaseprizecontroller = TextEditingController();
TextEditingController _sellingprizecontroller = TextEditingController();
TextEditingController _discountcontroller = TextEditingController();
void _delete(context, SalesProducts data) {
  Navigator.of(context).pop();

  _stockistfireref.doc(data.docId).delete();
  Fluttertoast.showToast(msg: 'deleted ', gravity: ToastGravity.TOP);
}
