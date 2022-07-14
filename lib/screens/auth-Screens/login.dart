import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/cubit/cubit/login_cubit.dart';
import 'package:fugipie_inventory/main.dart';
import 'package:fugipie_inventory/repository/authRepository.dart';
import 'package:fugipie_inventory/screens/auth-Screens/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static MaterialPage page() => MaterialPage(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF181826),
        child: BlocProvider(
            create: (_) => LoginCubit(
                  context.read<AuthRepository>(),
                ),
            child: const LoginForm()),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {}
        // TODO: implement listener
        print('you are not authrorized');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child:
                Image.asset('assets/images/fugipielogo.png', fit: BoxFit.cover),
          ),
          SizedBox(
            height: 40.0,
          ),
          const _EmailInput(),
          SizedBox(
            height: 20.0,
          ),
          _PasswordInput(),
          SizedBox(
            height: 20.0,
          ),
          _LoginButton(),
          SizedBox(
            height: 20.0,
          ),
          _SignupButton(),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                filled: true,
                fillColor: Color(0xFF373748),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                labelText: 'email',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (email) {
                context.read<LoginCubit>().emailChanged(email);
              },
            ));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            onChanged: (password) {
              context.read<LoginCubit>().passwordChanged(password);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              filled: true,
              fillColor: Color(0xFF373748),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              labelText: 'password',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

class _ForgetPass extends StatelessWidget {
  const _ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Forget Password');
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submiting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginwithcredential();
                },
                child: Text('submit'));
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push<void>(
            SignUpPage.route(),
          );
        },
        child: Text('signup'));
  }
}
