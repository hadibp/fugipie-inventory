import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugipie_inventory/bloc/counter/counter_bloc.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

class Cart extends Equatable {
  final List<SalesProducts> products;

  const Cart({this.products = const <SalesProducts>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    final quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
        print(' not exist');
      } else {
        quantity[product] += 1;
        Fluttertoast.showToast(
            msg: 'this product is already added', gravity: ToastGravity.BOTTOM);
        print('already exist');
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.total!.toDouble() ) ;
}
