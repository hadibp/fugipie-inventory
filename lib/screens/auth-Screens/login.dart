import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/cubit/cubit/login_cubit.dart';
import 'package:fugipie_inventory/main.dart';
import 'package:fugipie_inventory/repository/authRepository.dart';
import './signup.dart';

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
            child:  LoginForm()),
      ),
    );
  }
}
  final formkey =GlobalKey<FormState>();

class LoginForm extends StatelessWidget {
   LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
        print('you are not authrorized');

        }
        // TODO: implement listener
      },
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child:
                  Image.asset('assets/images/fugipielogo.png', fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const _EmailInput(),
            const SizedBox(
              height: 20.0,
            ),
            const _PasswordInput(),
            const SizedBox(
              height: 20.0,
            ),
            const _LoginButton(),
            const SizedBox(
              height: 20.0,
            ),
            const _SignupButton(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
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
            child: TextFormField(
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
              autofillHints: [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Please enter a valid email'
                      : null,
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
          child: TextFormField(
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
                  final form = formkey.currentState!;
                  if(form.validate()){

                  context.read<LoginCubit>().loginwithcredential();
                  }
                },
                child: const Text('Login'));
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
        child: const Text('signup'));
  }
}
