import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/modals/servicemodal.dart';

CollectionReference servicedb =
    FirebaseFirestore.instance.collection('servises');
final userid = FirebaseAuth.instance.currentUser?.uid;

class Serviceprovider extends ChangeNotifier {
  bool isloadding = false;
  TextEditingController issueidcontroller = TextEditingController();
  TextEditingController returndatecontroller = TextEditingController();
  TextEditingController servicechargecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  void servicemodelvalidator(context) async {
    if (issueidcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('id is empty'),
        ),
      );
    } else if (returndatecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('return data is empty'),
        ),
      );
    } else if (servicechargecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('service charge is empty'),
        ),
      );
    } else if (namecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('name is empty'),
        ),
      );
    } else if (phonecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('phone number is empty'),
        ),
      );
    } else {
      isloadding = true;
      notifyListeners();
      var uniqueId = servicedb.doc().id;

      FirebaseFirestore.instance.collection('servises').doc(uniqueId).set({
        'id': issueidcontroller.text,
        'uid': userid,
        'returndate': returndatecontroller.text,
        'servicecharge': servicechargecontroller.text,
        'name': namecontroller.text,
        'phone': phonecontroller.text,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('successfully added'),
          ),
        );
      });
    }
    notifyListeners();
  }

  List<ServiceModal> servicelist = [];
  ServiceModal? serviceModel;
  fectchserviceproductdata() async {
    List<ServiceModal> newservice = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('servises').get();

    value.docs.forEach(
      (element) {
        serviceModel = ServiceModal(
            issueId: element.get('issueid'),
            date: element.get('date'),
            servicecharge: element.get('servicecharge'),
            name: element.get('name'),
            phone: element.get('phone'));
        newservice.add(serviceModel!);
      },
    );
    servicelist = newservice;
    notifyListeners();
  }

  List<ServiceModal> get getServiceModal {
    return servicelist;
  }
}
