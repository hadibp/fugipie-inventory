import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/modals/cartmodal.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onloadcart);
    on<AddCartProduct>(_onAddProduct);
    on<RemoveCartProduct>(_onremoveProduct);
  }

  void _onloadcart(CartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(AddCartProduct event, Emitter<CartState> emit)  {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.products))));
      } on Exception {
        emit(CartError());
      }
    }
   
  }

  void _onremoveProduct(RemoveCartProduct event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..remove(event.products))));
      } on Exception {
        emit(CartError());
      }
    }
  }

   
    
  }

