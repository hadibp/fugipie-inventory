part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  var userId = FirebaseAuth.instance.currentUser?.uid;
  // final String? docId;

  final List<SalesProducts>? products;
  final String? name;
  final String? phone;
  final double? total;
  final CheckOut checkOut;

  CheckoutLoaded({
    this.userId,
    // this.docId,
    this.products,
    this.name,
    this.phone,
    this.total,
  }) : checkOut = CheckOut(
          userId: userId,
          // docId: docId,
          products: products,
          name: name,
          phone: phone,
          total: total,
        );

  @override
  List<Object?> get props => [
        userid,
        // docId,
        products,
        name,
        phone,
        total,
      ];
}
