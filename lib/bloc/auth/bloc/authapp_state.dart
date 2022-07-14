part of 'authapp_bloc.dart';

enum AppStatus { authenticated, unauthenticated }


class AuthappState extends Equatable {

  final AppStatus status;
  final Users user;
  const AuthappState._({required this.status, this.user = Users.empty});

  const AuthappState.authenticated(Users user)
      : this._(status: AppStatus.authenticated, user: user);

  const AuthappState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  

  @override
  List<Object> get props => [status, user];
}
