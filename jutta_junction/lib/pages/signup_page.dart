import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    //value != null && value.isEmpty
    //if (value!.isEmpty)
    if (_formkey.currentState!.validate())
      setState(() {
        changebutton = true;
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
                const SizedBox(
                  height: 20.0,
                  child: Text(
                    "Sign up to Jutta Junction to get started.",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 103, 117, 238),
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
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: " Enter your full name",
                          labelText: "Full Name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Full Name cannot be empty";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
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
                      TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(
                          hintText: "Enter your phone number",
                          labelText: "Phone Number",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number cannot be empty";
                          } else if (value.length < 10) {
                            return "Phone Number length should be 10 digits";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: false,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: "Enter your Email Address",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (!value.contains("@")) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: const InputDecoration(
                          hintText: "Enter your Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          } else if (value.length < 6) {
                            return "Username length should be atleast 6 charachter";
                          }
                          return null;
                        },
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        //controller: someTextXontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Hello',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          fillColor: Color.fromARGB(255, 103, 117, 238),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Color.fromARGB(255, 103, 117, 238),
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
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
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
