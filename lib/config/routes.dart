import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fugipie_inventory/bloc/auth/bloc/authapp_bloc.dart';
import 'package:fugipie_inventory/screens/home.dart';

import '../screens/auth-Screens/login.dart';

List<Page> onGenerateAppViewPage(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
   
  switch (state) {
    case AppStatus.authenticated:
      return [

        HomeRoute.page(),

        ];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
