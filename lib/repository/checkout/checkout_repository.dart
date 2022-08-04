import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fugipie_inventory/modals/checkoutmodel.dart';
import 'package:fugipie_inventory/repository/checkout/base_checkout_repository.dart';

class Checkoutrepository extends BaseCheckoutRepository{
  final FirebaseFirestore _firebaseFirestore;


  Checkoutrepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(CheckOut checkOut) {
    return _firebaseFirestore.collection('checkout').add(checkOut.toDocument());
  }

}