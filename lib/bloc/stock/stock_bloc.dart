// import 'dart:async';

// // import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:fugipie_inventory/bloc/stock/bloc_provider.dart';
// import 'package:meta/meta.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import './bloc_provider.dart';
// // import 'bloc_provider.dart';
// part 'stock_event.dart';
// part 'stock_state.dart';

// class StockBloc extends BlocBase {
//   StockBloc(){
//     // initial stream;
//   }
//   String id;
//   final _idController = StreamController<String>();
//   Stream<String> get OutId =>_idController.stream;
//   Sink<String> get _InId=> _idController.sink;
  

//   final _firestorecontroller = StreamController<QuerySnapshot>();
//   Stream<QuerySnapshot> get Outfirestore =>_firestorecontroller.stream;
//   Sink<QuerySnapshot> get _Infirestore => _firestorecontroller.sink;

//   @override
//   void dispose(){
//     _idController.close();
//     _firestorecontroller.close();
//   }

// }
 