import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

class CheckOut extends Equatable {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  // final String? docId;
  final String? name;
  final String? phone;
  final double? total;
  final List<SalesProducts>? products;

  CheckOut({
    required userId,
    // required this.docId,
    required this.name,
    required this.phone,
    required this.total,
    required this.products,
  });

  @override
  List<Object?> get props => [
        userId,
        // docId,
        name,
        phone,
        total,
        products,
      ];

  Map<String, Object> toDocument() {
    return {
      'userId': userId!,
      // 'docId': docId!,
      'name': name!,
      'phone': phone!,
      'total': total!,
      'products': products!.map(
        (product) {
          product.productname;
          product.date;
          product.id;
          product.discount;
          product.lowestprize;
          product.purchaseprize;
          product.quantity;
          product.vendor;
        },
      ).toList(),
    };
  }
}
