part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckOutEvent extends CheckoutEvent {
  // final String? docId;
  final String? userId;
  final String? name;
  final String? phone;
  final Cart? cart; 

  const UpdateCheckOutEvent({
    // this.docId,
    this.userId,
    this.name,
    this.phone,
    this.cart,
  });

  @override
  List<Object?> get props => [
        // docId,
        userid,
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
