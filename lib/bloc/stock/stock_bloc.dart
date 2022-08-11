import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
import 'package:fugipie_inventory/repository/salesproduct/salesrepo.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final SalesRepository _salesRepository;
  StreamSubscription? _streamSubscription;
  StreamSubscription? _stockSubscription;

  StockBloc({
    required SalesRepository salesRepository,
  })  : _salesRepository = salesRepository,
        super(StockLoading()) {
    on<LoadProdects>(_mapLoadProductToState);
    on<UpdateProdects>(_mapUpdateProductToState);
  }

  void _mapLoadProductToState(LoadProdects event, Emitter<StockState> emit) {
    _streamSubscription?.cancel();
    _streamSubscription = _salesRepository.getAllproducts().listen((products) {
      add(
        UpdateProdects(products),
      );
    });
  }

  void _mapUpdateProductToState(
      UpdateProdects event, Emitter<StockState> emit) {
    emit(StockLoaded(products: event.products));
  }
}
