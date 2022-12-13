import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/test/landingpage.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
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
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 109, 146, 189),
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.chat),
          Icon(Icons.shopping_cart),
          Icon(
            Icons.account_box,
            size: 30,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 109, 146, 189),
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/images/background.png",
          //   fit: BoxFit.fill,
          //   height: MediaQuery.of(context).size.height,
          // ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Sign up to Jutta Junction to get started.",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Full Name",
                          hintText: "Enter your full name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Full Name cannot be empty";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Password",
                          hintText: "Enter your password",
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
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Confirm Password",
                          hintText: "Enter your password",
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
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Email",
                          hintText: "Enter your email address",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          } else if (!value.contains("@")) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Phone Number",
                          hintText: "Enter your phone number",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number cannot be empty";
                          } else if (value.length < 10) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          labelText: "Username",
                          hintText: "Enter your username",
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
                      SizedBox(
                        height: 30.0,
                      ),
                      FloatingActionButton.extended(
                          label: Text('Signup'),
                          backgroundColor: Colors.deepPurple.shade300,
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LandingPage(),
                                ),
                              )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginPage()));
                            },
                            child: Text(
                              "Sign Up ",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
