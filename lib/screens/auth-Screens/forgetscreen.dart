import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgetpage extends StatelessWidget {
  Forgetpage({Key? key}) : super(key: key);
  TextEditingController _emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future passwordreset() async {
      try {
        print('hit');
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailcontroller.text);
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('check you inbox and spam'),
              );
            });
      } on FirebaseAuthException catch (e) {
        print(e);
        Fluttertoast.showToast(msg: e.code, gravity: ToastGravity.TOP);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff181826),
      appBar: AppBar(
        backgroundColor: const Color(0xff181826),
        elevation: 5.0,
        toolbarHeight: 80.0,
        title: Image.asset('assets/images/fugipielogo.png', fit: BoxFit.cover),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter you email and we will send \n you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                controller: _emailcontroller,
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
                onChanged: (email) {},
                autofillHints: [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Please enter a valid email'
                        : null,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                final form = _formkey.currentState!;
                passwordreset();
                if (form.validate()) {
                  print('object');
                }
              },
              child: Text('reset password'),
            ),
          ],
        ),
      ),
    );
  }
}
