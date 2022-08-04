part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? productname;
  final String? vendor;
  final int? quantity;
  final double? purchaseprize;
  final double? sellingprize;
  final double? discount;
  final List<SalesProducts>? products;
  final String? name;
  final String? phone;
  final CheckOut checkOut;

  CheckoutLoaded({
    this.productname,
    this.vendor,
    this.quantity,
    this.purchaseprize,
    this.sellingprize,
    this.discount,
    this.products,
    this.name,
    this.phone,
  }) : checkOut = CheckOut(
          productname: productname,
          vendor: vendor,
          quantity: quantity,
          purchaseprize: purchaseprize,
          sellingprize: sellingprize,
          discount: discount,
          products: products,
          name: name,
          phone: phone,
        );

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
}
