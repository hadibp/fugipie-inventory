// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

final CollectionReference _servicelistfireref =
    FirebaseFirestore.instance.collection('servises');

bool progresscolor = false;

class ServiceItem extends StatefulWidget {
  ServiceItem(this.datas, {Key? key}) : super(key: key);
  DocumentSnapshot? datas;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  List<bool>? isSelected = [true, false];

  var userid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 18, 33),
        appBar: AppBar(
          // toolbarHeight: 70.0,
          backgroundColor: Color(0xff181826),
          title: Text(
            'Servise > ' + 'Product ID : ${widget.datas?['id']}',
            style: const TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                _servicelistfireref.where('uid', isEqualTo: userid).snapshots(),
            builder: (context, snapshot) {
              print('${isSelected?[0]}');

              return Container(
                height: 500.0,
                width: 400.0,
                decoration: BoxDecoration(
                    color: Color(0xFF232333),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 18.0, right: 18.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Issue id : ${widget.datas?['id']}',
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
                    margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                    height: 40.0,
                    width: 400.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Return Date",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "${widget.datas?['returndate']}",
                              style: TextStyle(
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
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Isuue",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "${widget.datas?['issue']}",
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
                    margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                    height: 40.0,
                    width: 400.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "${widget.datas?['name']}",
                              style: TextStyle(
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
                            Text(
                              "Phone",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "${widget.datas?['phone']}",
                              style: TextStyle(
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
                            Text(
                              "Service Charge",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                            Text(
                              "\$ ${widget.datas?['servicecharge']}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(10.0),
                      fillColor: Colors.blue,
                      isSelected: isSelected!,
                      selectedColor: Colors.blueAccent,
                      renderBorder: true,
                      borderWidth: 2.0,
                      borderColor: Colors.blueAccent,
                      selectedBorderColor: Colors.blueAccent,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            'Completed',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            'onProgress',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      onPressed: (int newindex) {
                        setState(() {
                          for (int index = 0;
                              index < isSelected!.length;
                              index++) {
                            if (index == newindex) {
                              isSelected?[index] = true;
                              // progresscolor = true;
                              // print(progresscolor);
                            } else {
                              isSelected?[index] = false;
                              // progresscolor = false;
                              // print(progresscolor);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: (() async {
                      print('$isSelected');
                      await _editbottommodal(context);
                    }),
                    child: Text('Edit'),
                    // style: ButtonStyle(
                    //  backgroundColor: Colors.blueGrey,
                    // ),
                  ),
                  TextButton(
                    onPressed: () {
                      var uniqueId = _servicelistfireref
                          .doc(userid)
                          .collection('bag')
                          .doc()
                          .id;
                      var selected = isSelected?[0];
                      _servicelistfireref
                          .doc(userid)
                          .collection('bag')
                          .doc(uniqueId)
                          .set({
                        "id": widget.datas?['id'],
                        'userId': FirebaseAuth.instance.currentUser?.uid,
                        "issue": widget.datas?['issue'],
                        "name": widget.datas?['name'],
                        "returndate": widget.datas?['returndate'],
                        "servicecharge": widget.datas?['servicecharge'],
                        "phone": widget.datas?['phone'],
                        "progress": selected
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add to bag'),
                    // style: ButtonStyle(
                    //  backgroundColor: Colors.blueGrey,
                    // ),
                  )
                ]),
              );
            }));
  }

  _editbottommodal(BuildContext context) async {
    if (widget.datas != null) {
      _issueidcontroller.text = widget.datas?['id'];
      _returndatecontroller.text = widget.datas?['returndate'];
      _servicechargecontroller.text = widget.datas?['servicecharge'];
      _namecontroller.text = widget.datas?['name'];
      _phonecontroller.text = widget.datas?['phone'];
    }
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
                  buildText('Issue Id'),
                  TextField(
                    controller: _issueidcontroller,
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
                  buildText('Return Date'),
                  TextField(
                    controller: _returndatecontroller,
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
                  buildText('Service charge'),
                  TextField(
                    controller: _servicechargecontroller,
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
                    controller: _namecontroller,
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
                    controller: _phonecontroller,
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
                    padding: const EdgeInsets.all(15.0),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(10.0),
                      fillColor: Colors.blue,
                      isSelected: isSelected!,
                      selectedColor: Colors.blueAccent,
                      renderBorder: true,
                      borderWidth: 2.0,
                      borderColor: Colors.blueAccent,
                      selectedBorderColor: Colors.blueAccent,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            'Completed',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            'onProgress',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      onPressed: (int newindex) {
                        setState(() {
                          for (int index = 0;
                              index < isSelected!.length;
                              index++) {
                            if (index == newindex) {
                              isSelected?[index] = true;
                              // progresscolor = true;
                              // print(progresscolor);
                            } else {
                              isSelected?[index] = false;
                              // progresscolor = false;
                              // print(progresscolor);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      final firebaseauth = FirebaseAuth.instance;

                      final id = _issueidcontroller.text;
                      final returndate = _returndatecontroller.text;
                      final servicecharge = _servicechargecontroller.text;
                      final name = _namecontroller.text;
                      final phone = _phonecontroller.text;
                      var userId = firebaseauth.currentUser?.uid;

                      await _servicelistfireref.doc(widget.datas?.id).update({
                        'id': id,
                        'returndate': returndate,
                        'servicecharge': servicecharge,
                        'name': name,
                        'phone': phone,
                        'userId':userId
                      }).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('successfully updated'),
                          ),
                        );
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text('update'),
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
}

TextEditingController _issueidcontroller = TextEditingController();
TextEditingController _returndatecontroller = TextEditingController();
TextEditingController _servicechargecontroller = TextEditingController();
TextEditingController _namecontroller = TextEditingController();
TextEditingController _phonecontroller = TextEditingController();

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );
