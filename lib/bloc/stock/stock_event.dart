part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}

class LoadProdects extends StockEvent {}

class UpdateProdects extends StockEvent {
  final List<SalesProducts> products;

  const UpdateProdects(this.products);

  @override
  List<Object> get props => [products];
}
