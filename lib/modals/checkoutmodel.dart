import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

class CheckOut extends Equatable {
  var userid = FirebaseAuth.instance.currentUser?.uid;

  final String? productname;
  final String? vendor;
  final int? quantity;
  final double? purchaseprize;
  final double? sellingprize;
  final double? discount;
  final List<SalesProducts>? products;
  final String? name;
  final String? phone;
  final double? total;

  CheckOut(
      {required this.userid,
      required this.productname,
      required this.vendor,
      required this.quantity,
      required this.purchaseprize,
      required this.sellingprize,
      required this.discount,
      required this.products,
      required this.name,
      required this.phone,
      required this.total});

  @override
  List<Object?> get props => [
        productname,
        vendor,
        quantity,
        purchaseprize,
        sellingprize,
        discount,
        products,
        name,
        phone,
        total
      ];

  Map<String, dynamic> toDocument() {
    return {
      'uid': userid,
      'productname': productname,
      'vendor': vendor,
      'quantity': quantity,
      'purchaseprize': purchaseprize,
      'sellingprize': sellingprize,
      'discount': discount,
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
      'name': name,
      'phone': phone,
      'total':total,
    };
  }
}
