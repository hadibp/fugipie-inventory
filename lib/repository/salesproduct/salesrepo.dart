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
  Stream<List<SalesProducts>> getAllproducts()  {

    return _firebaseFirestore
        .collection('stocklist')
        // .where('userId', isEqualTo: userid)
        .orderBy('date',descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => SalesProducts.fromsnapshot(doc))
          .toList();
    });
  }
  @override
  Future<void> deleteProduct(SalesProducts salesProducts) {
    return _firebaseFirestore.collection('checkout').doc().delete();
  }
}
