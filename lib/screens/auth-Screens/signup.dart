import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/bloc/cubit/cubit/signup/signup_cubit.dart';
import 'package:fugipie_inventory/repository/authRepository.dart';

import '../../bloc/cubit/cubit/login_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  static MaterialPage page() => MaterialPage(child: SignUpPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181826),
      appBar: AppBar(
        title: Text('signup'),
        backgroundColor: Color(0xFF181826),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(context.read<AuthRepository>()),
          child: const SignUPForm(),
        ),
      )),
    );
  }
}

final formkey = GlobalKey<FormState>();

class SignUPForm extends StatelessWidget {
  const SignUPForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.error) {}
        // TODO: implement listener
        print('you are not authrorized in signup');
      },
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/fugipielogo.png',
                  fit: BoxFit.cover),
            ),
            SizedBox(
              height: 40.0,
            ),
            _EmailInput(),
            SizedBox(
              height: 20.0,
            ),
            _PasswordInput(),
            SizedBox(
              height: 20.0,
            ),
            _SignupButton(),
            SizedBox(
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
    return BlocBuilder<SignupCubit, SignupState>(
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
                context.read<SignupCubit>().emailChanged(email);
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
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            onChanged: (password) {
              context.read<SignupCubit>().passwordChanged(password);
            },
            style: TextStyle(color: Colors.white),
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

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submiting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  final form = formkey.currentState!;
                  if (form.validate()) {
                    context.read<SignupCubit>().Signupformsubmitted();
                  }
                },
                child: Text('Signup'));
      },
    );
  }
}
