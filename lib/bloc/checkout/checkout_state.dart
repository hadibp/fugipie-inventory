part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final CheckOut checkOut;
  final double? total;

  CheckoutLoaded({
    this.userid,
    this.productname,
    this.vendor,
    this.quantity,
    this.purchaseprize,
    this.sellingprize,
    this.discount,
    this.products,
    this.name,
    this.phone,
    this.total,
  }) : checkOut = CheckOut(
          userid: userid,
          productname: productname,
          vendor: vendor,
          quantity: quantity,
          purchaseprize: purchaseprize,
          sellingprize: sellingprize,
          discount: discount,
          products: products,
          name: name,
          phone: phone,
          total: total,
        );

  @override
  List<Object?> get props => [
        userid,
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
}
