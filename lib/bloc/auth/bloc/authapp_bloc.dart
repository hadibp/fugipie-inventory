import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

import '../../../modals/usermodal.dart';
import '../../../repository/authRepository.dart';

part 'authapp_event.dart';
part 'authapp_state.dart';

class AuthappBloc extends Bloc<AuthappEvent, AuthappState> {
  final AuthRepository _authRepository;
  StreamSubscription<Users>? _usersubsciption;

  AuthappBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentuser.isNotEmpty
              ? AuthappState.authenticated(authRepository.currentuser)
              : const AuthappState.unauthenticated(),
        ) {
    on<AppUserchanged>(_onUserchanged);
    on<AppLogoutRequsted>(_onLogoutRequsted);

    _usersubsciption = _authRepository.user.listen((user) {
      add(AppUserchanged(user));
    });
  }

  void _onUserchanged(AppUserchanged event, Emitter<AuthappState> emit) {
    emit(event.user.isNotEmpty
        ? AuthappState.authenticated(event.user)
        : const AuthappState.unauthenticated());
  }

  void _onLogoutRequsted(AppLogoutRequsted evnt, Emitter<AuthappState> emit) {
    unawaited(_authRepository.logout());
  }

  @override
  Future<void> close() {
    _usersubsciption?.cancel();
    return super.close();
  }
}
