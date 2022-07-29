import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/componants/sales/salesitem.dart';
import '../bloc/counter/counter_bloc.dart';

final CollectionReference _stocklistfireref =
    FirebaseFirestore.instance.collection('stocklist');
var userid = FirebaseAuth.instance.currentUser?.uid;

class SalesPage extends StatefulWidget {
  SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  String name = '';
  TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181826),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xff181826),
        elevation: 6,
        title: Text(
          'Sales Orders',
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
              height: 100.0,
              width: 180.0,
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
                          hintStyle: TextStyle(color: Color(0xFF707091)),
                          fillColor: Color(0xFF707091),
                        ),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                          print(val);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SalesItem(context, name)),
              );
            },
            icon: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stocklistfireref.where('uid', isEqualTo: userid).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
            if (_streamSnapshot.hasData) {
              print(_streamSnapshot.hasData);
              return ListView.builder(
                itemCount: _streamSnapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  final data = _streamSnapshot.data!.docs[index].data()
                      as Map<String, dynamic>;

                  if (name.isEmpty) {
                    print(name);
                    print(_streamSnapshot.data?.docs.length);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        tileColor: Color(0xFF232333),
                        title: Text(
                          data['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          data['id'],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 165, 163, 169)),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _salesbottommodal(context, data);
                            print(name);
                          },
                        ),
                      ),
                    );
                  } else if (data['id']
                      .toString()
                      .startsWith(name.toLowerCase())) {
                    print(name);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        tileColor: Color(0xFF232333),
                        title: Text(
                          data['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          data['id'],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 165, 163, 169)),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _salesbottommodal(context, data);
                            print(_streamSnapshot.data?.docs.length);
                            print(name);
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              );
            } else {
              return Container(
                child: Text(
                  'no product available',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }),
    );
  }
}

// textcontrolls

TextEditingController _productidcontroller = TextEditingController();
TextEditingController _datecontroller = TextEditingController();
TextEditingController _productnamecontroller = TextEditingController();
TextEditingController _vendorcontroller = TextEditingController();
TextEditingController _quatitycontroller = TextEditingController();
TextEditingController _purchaseprizecontroller = TextEditingController();
TextEditingController _sellingprizecontroller = TextEditingController();
TextEditingController _discountcontroller = TextEditingController();

Future<void> _salesbottommodal(context, data) async {
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

  final int sellingprise = int.parse(_sellingprizecontroller.text);
  final int discountprise = int.parse(_discountcontroller.text);

  final int totalamount = sellingprise - discountprise;
  // final int totalamount = 10 + sellingprise;
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
          initialChildSize: 0.8,
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
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Product Name'),
                TextField(
                  controller: _productnamecontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Vendor'),
                TextField(
                  controller: _vendorcontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Color(0xFF394371),
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
                  enabled: false,
                ),
                buildText('Quantity'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130.0,
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            _quatitycontroller.text =
                                state.counterValue.toString();
                            return TextField(
                              controller: _quatitycontroller,
                              decoration: const InputDecoration(
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
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 2, 2, 2),
                                      width: 2.0),
                                ),
                                enabled: false,
                              ),
                              cursorHeight: 30,
                              cursorColor: Colors.white,
                              style: TextStyle(
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
                buildText('purchase price'),
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
                  enabled: false,
                ),
                buildText('Selling price'),
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
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                  enabled: false,
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
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Center(
                        child: Text(
                          '-----     \$ ${state.counterValue! * totalamount}    -----',
                          style: TextStyle(color: Colors.grey, fontSize: 28.0),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        var total = state.counterValue! * totalamount;
                        var uniqueId = _stocklistfireref
                            .doc(userid)
                            .collection('cart-collection')
                            .doc()
                            .id;

                        _stocklistfireref
                            .doc(userid)
                            .collection('cart-collection')
                            .doc(uniqueId)
                            .set({
                          "id": data['id'],
                          "name": data['name'],
                          "vendor": data['vendor'],
                          "purchaseprize": data['purchaseprize'],
                          "quantity": state.counterValue,
                          "sellingprize": data['sellingprize'],
                          "discound": data['discound'],
                          "total": total,
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Add Item to cart'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel Item'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 171, 47, 47),
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
