import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<StockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
