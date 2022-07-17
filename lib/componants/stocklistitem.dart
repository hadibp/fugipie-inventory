import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';

import '../bloc/counter/counter_bloc.dart';

class StockListItem extends StatelessWidget {
  StockListItem(context, this.datas);

  DocumentSnapshot? datas;

  final CollectionReference _stockistfireref =
      FirebaseFirestore.instance.collection('stocklist');

  var userid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _stockistfireref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
          if (_streamSnapshot.hasData) {
            final data = datas;
            return Scaffold(
              backgroundColor: Color(0xff181826),
              appBar: AppBar(
                backgroundColor: Color(0xff181826),
                title: Text(
                  'Stock > ' + 'Product ID : ${data?['id']}',
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
                            const Text(
                              '11-02-2022',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Product id : ${data?['id']}',
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
                        margin:
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Product Name",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  " ${data?['name']}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Vendor",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "${data?['vendor']}",
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
                        margin: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Quantity",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "${data?['quantity']}",
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
                            EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Purchase Prize",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "\$${data?['purchaseprize']} ",
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
                        margin: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Lowest Prize",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "\$ ${data?['purchaseprize']}",
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
                        margin: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 10.0),
                        height: 40.0,
                        width: 400.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                                Text(
                                  "${data?['discound']} %",
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
                          onPressed: ()  {
                            print(data?.id);
                             _updatestockitem(context, data);
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
                            _delete(context, data!.id);
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
          } else {
            return Center(
              child: const Text('no data'),
            );
          }
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

  TextEditingController _productidcontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _productnamecontroller = TextEditingController();
  TextEditingController _vendorcontroller = TextEditingController();
  TextEditingController _quatitycontroller = TextEditingController();
  TextEditingController _purchaseprizecontroller = TextEditingController();
  TextEditingController _sellingprizecontroller = TextEditingController();
  TextEditingController _discountcontroller = TextEditingController();

  Future<void> _updatestockitem(context, [DocumentSnapshot? data]) async {
    if (data != null) {
      _productidcontroller.text = data['id'];
      _datecontroller.text = data['date'];
      _productnamecontroller.text = data['name'];
      _vendorcontroller.text = data['vendor'];
      _quatitycontroller.text = data['quantity'];
      _purchaseprizecontroller.text = data['purchaseprize'];
      _sellingprizecontroller.text = data['sellingprize'];
      _discountcontroller.text = data['discound'];
    }

    await showModalBottomSheet(
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
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                    onPressed: () async {
                      final _id = _productidcontroller.text;
                      final _date = _datecontroller.text;
                      final _name = _productnamecontroller.text;
                      final _vendor = _vendorcontroller.text;
                      final _quantity = _quatitycontroller.text;
                      final _purchaseprize = _purchaseprizecontroller.text;
                      final _sellingprize = _sellingprizecontroller.text;
                      final _discount = _discountcontroller.text;

                      await _stockistfireref.doc(data?.id).update({
                        'id': _id,
                        'date': _date,
                        'name': _name,
                        'vendor': _vendor,
                        'quantity': _quantity,
                        'purchaseprize': _purchaseprize,
                        'sellingprize': _sellingprize,
                        'discound': _discount
                      }).then((value) => ScaffoldMessenger.of(context)
                          .showSnackBar( const SnackBar(
                              content: Text("updated  the textfields"))));
Navigator.of(context).pop();                   },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text('update'),
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
                    child: Text('back'),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _delete(context, String stockid) async {
    await _stockistfireref.doc(stockid).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("todo deleted"),
      ),
    );
    Navigator.of(context).pop();
  }
}
