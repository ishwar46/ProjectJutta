import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:jutta_junction/pages/ForgotPassword.dart';
import 'package:jutta_junction/pages/home_page.dart';
import 'package:jutta_junction/pages/signup_page.dart';
import 'package:jutta_junction/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

import '../services/local_notification.dart';
import '../viewmodels/global_ui_viewmodel.dart';

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

   bool _obscureTextPassword = true;

  final _formKey = GlobalKey<FormState>();

  void login() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _ui.loadState(true);
    try {
      await _authViewModel.login(email.text, password.text).then((value) {

        NotificationService.display(
          title: "Welcome back",
          body: "Hello ${_authViewModel.loggedInUser?.fullName},\n Hope you are having a wonderful day.",
        );
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

    

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    color: Colors.purple,
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
                        validator:ValidateLogin.emailValidate,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: " Enter your username",
                          labelText: "Username",
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Username cannot be empty";
                        //   }

                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        validator: ValidateLogin.password,

                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: "Enter your Password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextPassword = !_obscureTextPassword;
                          });
                        },
                        child: Icon(
                          _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Password cannot be empty";
                        //   } else if (value.length < 6) {
                        //     return "Password length should be atleast 6 charachter";
                        //   }

                        //   return null;
                        // },
                      ),


                      SizedBox(height:10),

                      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                    return ForgotPassword();
                                  }
                                )
                              );
                            },
                            child:const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                          
                              ),),
                          )
                        ],
                      )),

                      const SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.purple.shade300,
                        borderRadius: BorderRadius.circular(
                          changebutton ? 50 : 8,
                        ),
                        child: InkWell(
                          onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomePage(),
        ),
      );
    },
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
                          Navigator.pushNamed(context, MyRoutes.signupRoute);
                        },
                        child: const Text(
                          
                          "Create a new account",
                          style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                ),
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
class ValidateLogin {
  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }
}