part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckOutEvent extends CheckoutEvent {
  final String? name;
  final String? phone;
  final String? userid;
  final Cart? cart; //---warning check this----//

  const UpdateCheckOutEvent({
    this.name,
    this.phone,
    this.userid,
    this.cart,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        userid,
        cart,
      ];
}

class ConfirmCheckOutEvent extends CheckoutEvent {
  final CheckOut checkout;

  const ConfirmCheckOutEvent({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
