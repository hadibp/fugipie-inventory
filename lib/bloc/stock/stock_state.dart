part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<SalesProducts> products;

  StockLoaded({this.products = const <SalesProducts>[]});

  @override
  List<Object> get props => [products];
}

class StockError extends StockState {
  @override
  List<Object> get props => [];
}
