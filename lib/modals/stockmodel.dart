import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SalesProducts extends Equatable {
  final String? id;
  final String? productname;
  final String? vendor;
  final num? quantity;
  final num? purchaseprize;
  final num? lowestprize;
  final num? discount;
  final Timestamp? date;

  SalesProducts({
    required this.id,
    required this.productname,
    required this.vendor,
    required this.quantity,
    required this.purchaseprize,
    required this.lowestprize,
    required this.discount,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        productname,
        vendor,
        quantity,
        purchaseprize,
        lowestprize,
        discount,
        date
      ];

  static SalesProducts fromsnapshot(DocumentSnapshot snap) {
    SalesProducts products = SalesProducts(
        id: snap['id'],
        productname: snap['name'],
        vendor: snap['vendor'],
        quantity: snap['quantity'],
        purchaseprize: snap['purchaseprize'],
        lowestprize: snap['sellingprize'],
        discount: snap['discound'],
        date: snap['date']);

    return products;
  }
  

}
