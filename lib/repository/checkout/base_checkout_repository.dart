import 'package:fugipie_inventory/modals/checkoutmodel.dart';

abstract class BaseCheckoutRepository{
  Future <void> addCheckout(CheckOut checkOut);
}