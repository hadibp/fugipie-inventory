import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/bloc/cart/cart_bloc.dart';
import 'package:fugipie_inventory/bloc/stock/stock_bloc.dart';
import 'package:fugipie_inventory/modals/cartmodal.dart';
import 'package:fugipie_inventory/modals/checkoutmodel.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
import 'package:fugipie_inventory/repository/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final Checkoutrepository _checkoutrepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required Checkoutrepository checkoutrepository,
  })  : _cartBloc = cartBloc,
        _checkoutrepository = checkoutrepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
              )
            : CheckoutLoading()) {
    on<UpdateCheckOutEvent>(_onupdatecheckout);
    on<ConfirmCheckOutEvent>(_onconfirmcheckout);

    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {}
    });
  }
  void _onupdatecheckout(
    UpdateCheckOutEvent event,
    Emitter<CheckoutState> emit,
  ) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
          productname: event.productname ?? state.productname,
          vendor: event.vendor ?? state.vendor,
          quantity: event.quantity ?? state.quantity,
          purchaseprize: event.purchaseprize ?? state.purchaseprize,
          sellingprize: event.sellingprize ?? state.sellingprize,
          discount: event.discount ?? state.discount,
          products: event.cart?.products ?? state.products,
          name: event.name ?? state.name,
          phone: event.phone ?? state.phone));
    }
  }

  void _onconfirmcheckout(
    ConfirmCheckOutEvent event,
    Emitter<CheckoutState> emit,
  ) async{
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutrepository.addCheckout(event.checkout);
        print('data uploaded');
      } catch (_) {
        
      }
    }
  }
}
