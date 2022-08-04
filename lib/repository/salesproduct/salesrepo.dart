import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
import 'package:fugipie_inventory/repository/salesproduct/base_sales.dart';

class SalesRepository extends BaseSalesRepository {
  final FirebaseFirestore _firebaseFirestore;

  SalesRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

var userid = FirebaseAuth.instance.currentUser?.uid;


  @override
  Stream<List<SalesProducts>> getAllproducts() {
    return _firebaseFirestore.collection('stocklist').where('uid', isEqualTo: userid).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => SalesProducts.fromsnapshot(doc))
            .toList());
  }
}
