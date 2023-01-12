import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:jutta_junction/pages/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool changebutton = false;
  bool _success = false;
  String _uid = "";

  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  


  void _login() async {
  try {
    final user = (await _auth.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _uid = user.uid.toString();
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  } on FirebaseAuthException catch (err) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.message.toString())));
  }
}

  moveToHome(BuildContext context) async {
    //value != null && value.isEmpty
    //if (value!.isEmpty)
    if (_formkey.currentState!.validate())
      setState(() {
        _login();
      });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changebutton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Jutta.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    "Please login to your account",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: " Enter your username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,

        
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6 charachter";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          changebutton ? 50 : 8,
                        ),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 40,
                            width: changebutton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changebutton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",  
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.homepageRoute);
                        },
                        child: const Text(
                          "Create a new account",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
