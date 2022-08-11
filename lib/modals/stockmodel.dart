import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/repository/salesproduct/salesrepo.dart';

class SalesProducts extends Equatable {
  final String? id;
  final String? userId;
  final String? docId;
  final String? productname;
  final String? vendor;
  final int? quantity;
  final num? purchaseprize;
  final num? lowestprize;
  final num? discount;
  final num? total;
  final Timestamp? date;

  SalesProducts({
    required this.id,
    required this.userId,
    required this.docId,
    required this.productname,
    required this.vendor,
    required this.quantity,
    required this.purchaseprize,
    required this.lowestprize,
    required this.discount,
    required this.date,
    required this.total,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        docId,
        productname,
        vendor,
        quantity,
        purchaseprize,
        lowestprize,
        discount,
        date,
        total,
      ];

  static SalesProducts fromsnapshot(DocumentSnapshot snap) {
    SalesProducts products = SalesProducts(
        id: snap['productid'],
        userId: snap['userId'],
        docId: snap['docId'],
        productname: snap['name'],
        vendor: snap['vendor'],
        quantity: snap['quantity'],
        purchaseprize: snap['purchaseprize'],
        lowestprize: snap['sellingprize'],
        discount: snap['discound'],
        total: snap['sellingprize'] - snap['discound'],
        date: snap['date']);

    return products;
  }

  static Future<void> deleteData(docId) {
    return FirebaseFirestore.instance
        .collection('stocklist').doc(docId)
        .delete();
    
  }
}
