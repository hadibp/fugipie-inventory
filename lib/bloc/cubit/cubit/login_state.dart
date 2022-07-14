part of 'login_cubit.dart';

enum LoginStatus { initial, submiting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  const LoginState(
      {required this.email, required this.password, required this.status});

  factory LoginState.initial() {
    return const LoginState(
        email: '', password: '', status: LoginStatus.initial);
  }

  @override
  List<Object> get props => [email,password,status ];

  LoginState copyWith({
    final String? email,
    final String? password,
    final LoginStatus? status,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }
}
