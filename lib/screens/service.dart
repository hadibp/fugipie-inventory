import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/modals/servicemodal.dart';
import 'package:fugipie_inventory/provider/serviceprovider.dart';
import 'package:provider/provider.dart';

import '../componants/servises/serviseitem.dart';

bool progresscolor = false;

final CollectionReference _servicelistfireref =
    FirebaseFirestore.instance.collection('servises');
var userid = FirebaseAuth.instance.currentUser?.uid;
// final CollectionReference _bagfireref = _servicelistfireref
//     .doc(userid)
//     .collection('bag');

class ServicePage extends StatelessWidget {
  TabController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181826),
      appBar: AppBar(
        title: Text('Servises'),
        backgroundColor: Color(0xFF181826),
        elevation: 0.0,
      ),
      body: Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)),
                width: 350.0,
                height: 40.0,
                margin: EdgeInsets.only(top: 25.0),
                child: TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    isScrollable: false,
                    tabs: const [
                      Tab(child: Text('Add a service', softWrap: false)),
                      Tab(
                          child: Text(
                        'To be returned',
                        softWrap: false,
                      )),
                      Tab(child: Text('Bag')),
                      // Tab(child: Text('ruff')),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  tabOne(context),
                  tabTwo(context),
                  tabThree(),
                  // tabfour(context),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _servicebottommodal(context) {
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
        Serviceprovider serviceprovider = Provider.of(context);

        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          builder: (_, controller) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            color: const Color(0xFF232338),
            child: ListView(
              controller: controller,
              padding: EdgeInsets.all(32),
              children: [
                buildText('Issue Id'),
                TextField(
                  controller: serviceprovider.issueidcontroller,
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
                buildText('Issue'),
                TextField(
                  controller: serviceprovider.issuecontroller,
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
                buildText('Return Date'),
                TextField(
                  controller: serviceprovider.returndatecontroller,
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
                buildText('Service charge'),
                TextField(
                  controller: serviceprovider.servicechargecontroller,
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
                buildText('Name'),
                TextField(
                  controller: serviceprovider.namecontroller,
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
                buildText('Phone'),
                TextField(
                  controller: serviceprovider.phonecontroller,
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
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    serviceprovider.servicemodelvalidator(context);
                  },
                  child: Text('submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('close'),
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

Widget tabOne(context) {
  Serviceprovider serviceprovider = Provider.of(context);

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 150.0),
      child: FloatingActionButton(
        heroTag: 'service tag',
        backgroundColor: Colors.blueAccent,
        onPressed: (() {
          _servicebottommodal(context);
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

Widget tabTwo(context) {
  Serviceprovider serviceprovider = Provider.of(context);

  return StreamBuilder<QuerySnapshot>(
      stream: _servicelistfireref.where('uid', isEqualTo: userid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
        if (_streamSnapshot.hasData) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 50.0, top: 15.0, bottom: 5.0),
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  enabled: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF707091),
                    ),
                    iconColor: Colors.white,
                    hintText: 'search product id',
                    hintStyle: TextStyle(color: Color(0xFF707091)),
                    filled: true,
                    fillColor: Color(0xFF373748),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                    itemCount: _streamSnapshot.data?.docs.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      final DocumentSnapshot data =
                          _streamSnapshot.data!.docs[index];

                      return Center(
                          child: ListTile(
                        title: Center(
                            child: Container(
                          height: 340.0,
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
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
                              margin: EdgeInsets.only(
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
                                      Text(
                                        "Return Date",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data['returndate']}",
                                        style: TextStyle(
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
                              margin: EdgeInsets.only(
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
                                      Text(
                                        "Isuue",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data['issue']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                        ),
                                        softWrap: true,
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF373748),
                                  borderRadius: BorderRadius.circular(10.0)),
                              margin: EdgeInsets.only(
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
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "${data['name']}",
                                        style: TextStyle(
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
                              margin: EdgeInsets.only(
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
                                      Text(
                                        "Service Charge",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                      Text(
                                        "\$ ${data['servicecharge']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 20.0, right: 35.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "OnProgress",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                  child: Text(
                                    'More >',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceItem(data),
                                        ));
                                  }),
                            )
                          ]),
                        )),
                      ));
                    }),
              ),
            ),
          ]);
        } else {
          return Text('no data');
        }
      });
}
// } else {
//   return Text('no data');
// }

Widget tabThree() {
  return StreamBuilder<QuerySnapshot>(
      stream: _servicelistfireref.doc(userid).collection('bag').where('userId', isEqualTo: userid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> _streamSnapshot) {
        var itemCount = _streamSnapshot.data?.docs.length;
        print(itemCount);
        return Container(
          padding: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
          child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (
                context,
                index,
              ) {
                final data = _streamSnapshot.data?.docs[index];
                return Center(
                    child: ListTile(
                  title: Center(
                      child: Container(
                    // height: 250.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF232333),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 18.0, right: 18.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Issue id :${data?['id']}',
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Issue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                              Text(
                                "${data?['issue']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                                softWrap: true,
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                              Text(
                                "${data?['name']}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 35.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Completed",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: data?['progress'] ?? true
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 5.0,
                        thickness: 5.0,
                        color: Color.fromARGB(255, 78, 78, 78),
                        indent: 18.0,
                        endIndent: 18.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0, bottom: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Service Charge",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                              Text(
                                "${data?['servicecharge']}",
                                style:const TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                            ]),
                      ),
                    ]),
                  )),
                ));
              }),
        );
      });
}

// Widget tabfour(context) {
//   final Serviceprovider serviceprovider = Serviceprovider();

//           final DocumentSnapshot data = _streamSnapshot.data!.docs[index];
//   return Container(
//     padding: EdgeInsets.all(3.0),
//     child: ListView(

//           return Center(
//               child: ListTile(
//             title: Center(
//                 child: Container(
//               height: 340.0,
//               width: 400.0,
//               decoration: BoxDecoration(
//                   color: Color(0xFF232333),
//                   borderRadius: BorderRadius.circular(10.0)),
//               child: Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Product id : ${data['id']}',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   height: 2.0,
//                   thickness: 3.0,
//                   color: Color.fromARGB(255, 78, 78, 78),
//                   indent: 18.0,
//                   endIndent: 18.0,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFF373748),
//                       borderRadius: BorderRadius.circular(10.0)),
//                   margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
//                   height: 40.0,
//                   width: 400.0,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Return Date",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                           Text(
//                             "${data['returndate']}",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                         ]),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFF373748),
//                       borderRadius: BorderRadius.circular(10.0)),
//                   margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
//                   height: 40.0,
//                   width: 400.0,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15.0,
//                       right: 15.0,
//                     ),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Isuue",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                           Text(
//                             "${data['issue']}",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 13.0,
//                             ),
//                             softWrap: true,
//                           ),
//                         ]),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFF373748),
//                       borderRadius: BorderRadius.circular(10.0)),
//                   margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
//                   height: 40.0,
//                   width: 400.0,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Name",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                           Text(
//                             "${data['name']}",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                         ]),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xFF373748),
//                       borderRadius: BorderRadius.circular(10.0)),
//                   margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
//                   height: 40.0,
//                   width: 400.0,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Service Charge",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                           Text(
//                             "\$ ${data['servicecharge']}",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                         ]),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 15.0, left: 20.0, right: 35.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "OnProgress",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Container(
//                         width: 10.0,
//                         height: 10.0,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: progresscolor
//                               ? Color.fromARGB(255, 244, 16, 16)
//                               : Color.fromARGB(255, 19, 164, 0),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: GestureDetector(
//                       child: Text(
//                         'More >',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ServiceItem(data),
//                             ));
//                       }),
//                 )
//               ]),
//             )),
//           ));
//         }),
//   );
// }
