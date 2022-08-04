part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent{
  @override
  List<Object> get props => [];
}
class AddCartProduct extends CartEvent{
  final SalesProducts products;

  const AddCartProduct(this.products);
  @override
  List<Object> get props => [products];
}
class RemoveCartProduct extends CartEvent{
    final SalesProducts products;

  const RemoveCartProduct(this.products);
  @override
  List<Object> get props => [products];
}