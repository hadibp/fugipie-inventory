import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/cart/cart_bloc.dart';
import 'package:fugipie_inventory/bloc/checkout/checkout_bloc.dart';
import 'package:fugipie_inventory/bloc/stock/stock_bloc.dart';
import 'package:fugipie_inventory/firebase_options.dart';
import 'package:fugipie_inventory/modals/TodosModel.dart';
import 'package:fugipie_inventory/provider/serviceprovider.dart';
import 'package:fugipie_inventory/repository/authRepository.dart';
import 'package:fugipie_inventory/repository/checkout/checkout_repository.dart';
import 'package:fugipie_inventory/repository/salesproduct/salesrepo.dart';
import 'package:provider/provider.dart';
import 'bloc/auth/appobserver.dart';
import 'bloc/auth/bloc/authapp_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'config/routes.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepository = AuthRepository();
      runApp(MyApp(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository;
  const MyApp({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AuthappBloc(authRepository: _authRepository),
        child: const Appview(),
      ),
    );
  }
}

class Appview extends StatelessWidget {
  const Appview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodosModel>(
          create: (context) => TodosModel(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        ChangeNotifierProvider<Serviceprovider>(
          create: (context) => Serviceprovider(),
        ),
        BlocProvider(
          create: (context) => StockBloc(
            salesRepository: SalesRepository(),
          )..add(LoadProdects()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(LoadCart()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutrepository: Checkoutrepository(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlowBuilder(
          state: context.select(
            (AuthappBloc bloc) => bloc.state.status,
          ),
          onGeneratePages: onGenerateAppViewPage,
        ),
      ),
    );
  }
}
