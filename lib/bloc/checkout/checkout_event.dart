part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckOutEvent extends CheckoutEvent {
  final String? productname;
  final String? vendor;
  final int? quantity;
  final double? purchaseprize;
  final double? sellingprize;
  final double? discount;
  final String? name;
  final String? phone;
  final Cart? cart; //---warning check this----//

  const UpdateCheckOutEvent({
    this.productname,
    this.vendor,
    this.quantity,
    this.purchaseprize,
    this.sellingprize,
    this.discount,
    this.name,
    this.phone,
    this.cart,
  });

   @override
  List<Object?> get props => [
    productname,
        vendor,
        quantity,
        purchaseprize,
        sellingprize,
        discount,
        name,
        phone,
        cart,
  ];
}

class ConfirmCheckOutEvent extends CheckoutEvent {
  final CheckOut checkout;

  const ConfirmCheckOutEvent({required this.checkout});

    @override
  List<Object?> get props => [checkout];

}
