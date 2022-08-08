import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/modals/stockmodel.dart';
import 'package:fugipie_inventory/repository/salesproduct/salesrepo.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final SalesRepository _salesRepository;
  StreamSubscription? _streamSubscription;
  StreamSubscription? _stockSubscription;


  StockBloc({required SalesRepository salesRepository})
      : _salesRepository = salesRepository,
        super(StockLoading()) {
    on<LoadProdects>(_mapLoadProductToState);
    on<UpdateProdects>(_mapUpdateProductToState);
    // on<DeleteProdects>(_deleteProductToState);
  }

  void _mapLoadProductToState(LoadProdects event, Emitter<StockState> emit)  {
    _streamSubscription?.cancel();
     _streamSubscription =  _salesRepository.getAllproducts().listen((products) {
      add(
        UpdateProdects(products),
      );
    });
  }

  void _mapUpdateProductToState(UpdateProdects event, Emitter<StockState> emit) {
    emit(StockLoaded(products: event.products));
  }

  // void _deleteProductToState(DeleteProdects event, Emitter<StockState> emit) 
  //     async {
  //   // _stockSubscription?.cancel();
  //   if (state is StockLoaded) {
  //     try {
  //       await _salesRepository.deleteProduct(event.products.indexOf(docmen));
  //       print('data uploaded');
  //     } catch (_) {}
  //   }
  
  // }

  // @override
  // Stream<StockState> mapEventToState(
  //   StockEvent event,
  // ) async* {
  //   if (event is LoadProdects) {
  //     yield* _mapLoadProductToState();
  //   }
  //   if (event is UpdateProdects) {
  //     yield* _mapUpdateProductToState(event);
  //   }
  // }
  // Stream<StockState> _mapLoadProductToState() async* {
  //   _streamSubscription?.cancel();
  //   _streamSubscription = _salesRepository.getAllproducts().listen((products) {
  //     add(UpdateProdects(products),);
  //    });

  // }

  // Stream <StockState> _mapUpdateProductToState(UpdateProdects event) async* {
  //   yield StockLoaded(products: event.products);
  // }
}
