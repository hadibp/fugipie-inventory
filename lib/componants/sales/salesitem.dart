import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/cart/cart_bloc.dart';
import 'package:fugipie_inventory/bloc/checkout/checkout_bloc.dart';
import 'package:fugipie_inventory/bloc/counter/counter_bloc.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
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
  SalesItem(context, {Key? key}) : super(key: key);
  // var data;

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
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.cart
                            .productQuantity(state.cart.products)
                            .keys
                            .length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          final SalesProducts data = state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index);
                          final quantity = state.cart
                              .productQuantity(state.cart.products)
                              .values
                              .elementAt(index);

                          return ListTile(
                            title: Center(
                                child: Container(
                              height: 270.0,
                              width: 400.0,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF232333),
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
                                            'Product id : ${data.id}',
                                            // '',
                                            style: const TextStyle(
                                                color: Colors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            alignment: Alignment.topRight,
                                            onPressed: () {
                                              context.read<CartBloc>().add(
                                                  RemoveCartProduct(data));
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
                                              data.productname.toString(),
                                              style: const TextStyle(
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
                                            const Text(
                                              "Vendor",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0),
                                            ),
                                            Text(
                                              data.vendor.toString(),
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
                                              "Quantity",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0),
                                            ),
                                            BlocBuilder<CounterBloc,
                                                CounterState>(
                                              builder: (context, state) {
                                                var oquantitiy = state.counterValue! + quantity!;
                                                print('quantitiy = ${quantity}');
                                                print('staet = ${state.counterValue}');
                                                return Text(
                                                  oquantitiy .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.0),
                                                );
                                              },
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
                                              data.purchaseprize.toString(),
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
                                              data.lowestprize.toString(),
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
                                              "Discount ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0),
                                            ),
                                            Text(
                                              data.discount.toString(),
                                              style: const TextStyle(
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
                                              data.total.toString(),
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
                                'Total items (${state.cart.products.length.toString()})',
                                style: const TextStyle(
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
                              state.cart.subtotal.toString(),
                              style: const TextStyle(
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
                        state.cart.products.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 220, 82, 72),
                      ),
                      child:const Text('clear'),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('somthing is wrong'),
              );
            }
          },
        ));
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
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CheckoutLoaded) {
                  return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        buildText('Customer Name'),
                        textField((value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckOutEvent(name: value));
                        }, _custamernamecontroller),
                        buildText('phone'),
                        textField((value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateCheckOutEvent(phone: value));
                        }, _mobphonecontroller),
                        SizedBox(
                          width: 320.0,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.whatsapp),
                            onPressed: () {
                              final whatsappnum = _mobphonecontroller.text;
                              final custname = _custamernamecontroller.text;

                              sendtowhatsapp(
                                mobnumber: whatsappnum,
                                name: custname,
                              );
                            },
                            label: const Text(
                              'Send Bill',
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
                            onPressed: () {
                              context.read<CheckoutBloc>().add(
                                    ConfirmCheckOutEvent(
                                        checkout: state.checkOut),
                                  );
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 171, 47, 47),
                              ),
                            ),
                            child: const Text('Save Bill'),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Text('somthing went wrong');
                }
              },
            ),
          ]);
        });
  }

  Padding textField(
      Function(String) onChanged, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
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
    );
  }
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

// Future<void> _deleteitem(context, String productId) async {
//   await _stocklistfireref
//       .doc(userid)
//       .collection('cart-collection')
//       .doc(productId)
//       .delete();
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text("removed from cart"),
//     ),
//   );
// }
