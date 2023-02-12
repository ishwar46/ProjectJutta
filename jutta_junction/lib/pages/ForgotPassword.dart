import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/onboarding_screen.dart';
import 'package:jutta_junction/pages/OtpVerification.dart';
import 'package:jutta_junction/pages/login_page.dart';

import '../customs/custom_icons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
//has to be valid email address for receiving the email
            content:
                Text('Password reset link has been sent. Check your email.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 18, 19, 21),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 20, 21, 23),
        elevation: 0,
        //   children: [
        leading: Center(
          child: Container(
            child: CustomIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Text("Forgot Password?",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Text(
            "E-Mail",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Email Address',
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              errorStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your number!";
              } else if (value.length < 10) {
                return "Invalid Number";
              }

              return null;
            },
          ),
          SizedBox(height: 20),
          CustomButton(
            title: "Send OTP",
            onPressed: () {
              resetPassword();

              // Navigator.push(

              // context,
              // MaterialPageRoute(
              //   builder: (context) => OtpVerify(),
              // ));
            },
            //  ),
            //       const SizedBox(height: 20),
            //       ElevatedButton(
            //         child: const Text('Back'),
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => const LoginPage()),
            //           );
            //         },
          )
        ]),
      ),
    );
  }
}
