import 'package:fugipie_inventory/modals/stockmodel.dart';

abstract class BaseSalesRepository{
  Stream<List<SalesProducts>> getAllproducts();
}