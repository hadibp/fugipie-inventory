import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

class CheckOut extends Equatable {
  final String? productname;
  final String? vendor;
  final int? quantity;
  final double? purchaseprize;
  final double? sellingprize;
  final double? discount;
  final List<SalesProducts>? products;
  final String? name;
  final String? phone;

  CheckOut(
      {required this.productname,
      required this.vendor,
      required this.quantity,
      required this.purchaseprize,
      required this.sellingprize,
      required this.discount,
      required this.products,
      required this.name,
      required this.phone});

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
      ];

  Map<String, dynamic> toDocument() {
    return {
      'productname': productname,
      'vendor': vendor,
      'quantity': quantity,
      'purchaseprize': purchaseprize,
      'sellingprize': sellingprize,
      'discount': discount,
      'products': products!.map(
        (product) {
          product.productname;
          // product.discount;
        },
      ).toList(),
      'name': name,
      'phone': phone,
    };
  }
}
