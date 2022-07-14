part of 'authapp_bloc.dart';

abstract class AuthappEvent extends Equatable {
  const AuthappEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequsted extends AuthappEvent{

}

class AppUserchanged extends AuthappEvent{
  final Users user;

  const AppUserchanged(this.user);

  @override
  List<Object> get props => [user];

}