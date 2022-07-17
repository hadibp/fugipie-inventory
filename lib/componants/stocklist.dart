import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/componants/servises/serviseitem.dart';
import 'package:fugipie_inventory/componants/stocklistitem.dart';
import 'package:fugipie_inventory/screens/stock.dart';

import '../bloc/counter/counter_bloc.dart';

class StockList extends StatelessWidget {
  StockList({Key? key}) : super(key: key);

  final CollectionReference _todolistfireref =
      FirebaseFirestore.instance.collection('stocklist');
  var userid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _todolistfireref.where('uid', isEqualTo: userid).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
          if (_streamSnapshot.data?.size != null) {
            print(_streamSnapshot.data?.docs.length);
            print(_streamSnapshot.data?.size);

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
                                  hintText: 'search product id',
                                  hintStyle:
                                      TextStyle(color: Color(0xFF707091)),
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
                        heroTag: 'tag stock',
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
                  itemCount: _streamSnapshot.data?.docs.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final DocumentSnapshot data = _streamSnapshot.data!.docs[index];
                    final docid = data['id'];

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '11-02-2022',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Product id : ${data['id']}',
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
                            margin:const EdgeInsets.only(
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
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                    Text(
                                      "${data['name']}",
                                      style:const TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF373748),
                                borderRadius: BorderRadius.circular(10.0)),
                            margin:const EdgeInsets.only(
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
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                    Text(
                                      "${data['vendor']}",
                                      style:const TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF373748),
                                borderRadius: BorderRadius.circular(10.0)),
                            margin:const EdgeInsets.only(
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
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                    Text(
                                      "${data['quantity']}",
                                      style:const TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: GestureDetector(
                                child:const Text(
                                  'More > ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                        print(docid);

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
                  }),
            );
          } else {
            print(false);
            print(_streamSnapshot.data?.docs.length);
            print(_streamSnapshot.data?.size);
            return StockPage();
          }
        });
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
                  onChanged: (String text){
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
                    final _name =  _productnamecontroller.text;
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

void _insertstokRecord(  id,date, name,  vendor, quantity, purchaseprize, sellingprize, discount) {
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
  _firebaseref.collection('stocklist').doc(uniqueId).
  set({
    'uid': userid,
    'id': id,
    'date':date,
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
