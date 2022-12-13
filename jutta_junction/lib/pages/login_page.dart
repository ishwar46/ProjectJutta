import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:jutta_junction/pages/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    await Navigator.pushNamed(context, MyRoutes.landingRoute);
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
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
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
                      //forgot password link
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                          child: Text(
                        "Forgot Password ? ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
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
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account ? ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const RegPage()));
                            },
                            child: Text(
                              "Sign Up ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
