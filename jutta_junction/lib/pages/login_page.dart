import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/services/local_notification.dart';
import 'package:provider/provider.dart';

import 'dart:ui';


import '../Dashboard/NewHomePage.dart';

import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

import '../services/local_notification.dart';
import 'ForgotPassword.dart';


import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureTextPassword = true;

  final _formKey = GlobalKey<FormState>();

  void login() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    print("LOGIN PRESSED");
    _ui.loadState(true);
    try {
      await _authViewModel
          .login(_emailController.text, _passwordController.text)
          .then((value) {
        NotificationService.display(
          title: "Welcome back",
          body:
              "Hello ${_authViewModel.loggedInUser?.fullName},\n Hope you are having a wonderful day.",
        );
        Navigator.of(context).pushReplacementNamed('/NewHomePage');
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
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
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidateLogin.emailValidate,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 22.0,
                      ),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureTextPassword,
                    validator: ValidateLogin.password,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 22.0,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextPassword = !_obscureTextPassword;
                          });
                        },
                        child: Icon(
                          _obscureTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                        // borderRadius: BorderRadius.circular(
                        //   // changebutton ? 50 : 8,
                        // ),
                        child: InkWell(
                          onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Newhomepage(),
        ),
      );
    },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 40,
                            // width: changebutton ? 50 : 150,
                            // alignment: Alignment.center,
                            // child: changebutton
                            //     ? const Icon(
                            //         Icons.done,
                            //         color: Colors.white,
                            //       )
                            //     : const Text(
                            //         "Login",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 18),
                            //       ),
                          ),
                        ),
                      ),
                  //     TextButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, MyRoutes.signupRoute);}

                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/forget-password");
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.blue))),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 20)),
                        ),
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you new? Create an account ",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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




// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:jutta_junction/main.dart';
// // import 'package:jutta_junction/pages/ForgotPassword.dart';
// // import 'package:jutta_junction/pages/home_page.dart';
// // import 'package:jutta_junction/pages/signup_page.dart';
// // import 'package:jutta_junction/viewmodels/auth_viewmodel.dart';
// // import 'package:provider/provider.dart';
// // import 'package:velocity_x/velocity_x.dart';
// // import 'dart:ui';

// // import '../services/local_notification.dart';
// // import '../viewmodels/global_ui_viewmodel.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   TextEditingController _emailController = TextEditingController();
// //   TextEditingController _passwordController = TextEditingController();

// //   bool _obscureTextPassword = true;
// //   bool changebutton = false;

// //   final _formKey = GlobalKey<FormState>();

// //   void login() async {
// //     if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
// //       return;
// //     }
// //     _ui.loadState(true);
// //     try {
// //       await _authViewModel
// //           .login(_emailController.text, _passwordController.text)
// //           .then((value) {
// //         NotificationService.display(
// //           title: "Welcome back",
// //           body:
// //               "Hello ${_authViewModel.loggedInUser?.fullName},\n Hope you are having a wonderful day.",
// //         );
// //         Navigator.of(context).pushReplacementNamed('/dashboard');
// //       }).catchError((e) {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text(e.message.toString())));
// //       });
// //     } catch (err) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text(err.toString())));
// //     }
// //     _ui.loadState(false);
// //   }

// //   late GlobalUIViewModel _ui;
// //   late AuthViewModel _authViewModel;
// //   @override
// //   void initState() {
// //     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
// //     _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //         color: context.canvasColor,
// //         child: SingleChildScrollView(
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               children: [
// //                 Image.asset(
// //                   "assets/images/Jutta.png",
// //                   fit: BoxFit.cover,
// //                 ),
// //                 const SizedBox(
// //                   height: 20.0,
// //                   child: Text(
// //                     "Please login to your account",
// //                     style: TextStyle(fontSize: 15, color: Colors.black),
// //                   ),
// //                 ),
// //                 const Text(
// //                   "Welcome",
// //                   style: TextStyle(
// //                     fontSize: 28,
// //                     color: Colors.purple,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 // ignore: prefer_const_constructors
// //                 SizedBox(
// //                   height: 20.0,
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(
// //                       vertical: 16.0, horizontal: 32.0),
// //                   child: Column(
// //                     children: [
// //                       TextFormField(
// //                         controller: _emailController,
// //                         validator: ValidateLogin.emailValidate,
// //                         // ignore: prefer_const_constructors
// //                         decoration: InputDecoration(
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(30.0),
// //                           ),
// //                           hintText: " Enter your username",
// //                           labelText: "Username",
// //                         ),
// //                         // validator: (value) {
// //                         //   if (value!.isEmpty) {
// //                         //     return "Username cannot be empty";
// //                         //   }

// //                         //   return null;
// //                         // },
// //                       ),
// //                       const SizedBox(
// //                         height: 20,
// //                       ),
// //                       TextFormField(
// //                         controller: _passwordController,
// //                         validator: ValidateLogin.password,

// //                         obscureText: true,
// //                         // ignore: prefer_const_constructors
// //                         decoration: InputDecoration(
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(30.0),
// //                           ),
// //                           hintText: "Enter your Password",
// //                           labelText: "Password",
// //                           suffixIcon: GestureDetector(
// //                             onTap: () {
// //                               setState(() {
// //                                 _obscureTextPassword = !_obscureTextPassword;
// //                               });
// //                             },
// //                             child: Icon(
// //                               _obscureTextPassword
// //                                   ? Icons.visibility
// //                                   : Icons.visibility_off,
// //                               size: 20.0,
// //                               color: Colors.black,
// //                             ),
// //                           ),
// //                         ),
// //                         // validator: (value) {
// //                         //   if (value!.isEmpty) {
// //                         //     return "Password cannot be empty";
// //                         //   } else if (value.length < 6) {
// //                         //     return "Password length should be atleast 6 charachter";
// //                         //   }

// //                         //   return null;
// //                         // },
// //                       ),
// //                       SizedBox(height: 10),
// //                       Padding(
// //                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.end,
// //                             children: [
// //                               GestureDetector(
// //                                 onTap: () {
// //                                   Navigator.push(context,
// //                                       MaterialPageRoute(builder: (context) {
// //                                     return ForgotPassword();
// //                                   }));
// //                                 },
// //                                 child: const Text(
// //                                   'Forgot Password?',
// //                                   style: TextStyle(
// //                                     color: Colors.blue,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               )
// //                             ],
// //                           )),
// //                       const SizedBox(
// //                         height: 40.0,
// //                       ),
// //                       Material(
// //                         color: Colors.purple.shade300,
// //                         borderRadius: BorderRadius.circular(
// //                           changebutton ? 50 : 8,
// //                         ),
// //                         child: InkWell(
// //                           onTap: () {
// //                             login();
// //                           },
// //                           child: AnimatedContainer(
// //                             duration: Duration(seconds: 1),
// //                             height: 40,
// //                             width: changebutton ? 50 : 150,
// //                             alignment: Alignment.center,
// //                             child: changebutton
// //                                 ? const Icon(
// //                                     Icons.done,
// //                                     color: Colors.white,
// //                                   )
// //                                 : const Text(
// //                                     "Login",
// //                                     style: TextStyle(
// //                                         color: Colors.white,
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 18),
// //                                   ),
// //                           ),
// //                         ),
// //                       ),
// //                       TextButton(
// //                         onPressed: () {
// //                           Navigator.pushNamed(context, MyRoutes.signupRoute);
// //                         },
// //                         child: const Text(
// //                           "Create a new account",
// //                           style: TextStyle(
// //                             color: Colors.blue,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ));
// //   }
// // }

// // class ValidateLogin {
// //   static String? emailValidate(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return "Email is required";
// //     }

// //     return null;
// //   }

// //   static String? password(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return "Password is required";
// //     }
// //     return null;
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:jutta_junction/Dashboard/NewHomePage.dart';
// import 'package:jutta_junction/main.dart';
// import 'package:provider/provider.dart';
// import 'dart:ui';
// import '../../viewmodels/auth_viewmodel.dart';
// import '../../viewmodels/global_ui_viewmodel.dart';
// import '../services/local_notification.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   static Future<User?> signInWithEmailAndPassword(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         print("No user found for that email");
//       }
//     }
//     return user;
//   }

//   @override
//   // void initState() {
//   //   _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//   //   _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     bool _obscureTextPassword = true;
//     final _formKey = GlobalKey<FormState>();

//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "assets/images/Jutta.png",
//                     height: 100,
//                     width: 100,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Email cannot be empty";
//                       }
//                       return null;
//                     },
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Colors.black,
//                         size: 22.0,
//                       ),
//                       hintText: 'Email Address',
//                       hintStyle: TextStyle(
//                           fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: _obscureTextPassword,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Password cannot be empty";
//                       }
//                       return null;
//                     },
//                     style: const TextStyle(
//                         fontFamily: 'WorkSansSemiBold',
//                         fontSize: 16.0,
//                         color: Colors.black),
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       prefixIcon: const Icon(
//                         Icons.lock,
//                         size: 22.0,
//                         color: Colors.black,
//                       ),
//                       hintText: 'Password',
//                       hintStyle: const TextStyle(
//                           fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _obscureTextPassword = !_obscureTextPassword;
//                           });
//                         },
//                         child: Icon(
//                           _obscureTextPassword
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           size: 20.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushNamed("/forget-password");
//                         },
//                         child: Text(
//                           "Forgot password?",
//                           style: TextStyle(color: Colors.grey.shade800),
//                         ),
//                       )),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                       side: BorderSide(color: Colors.blue))),
//                           padding: MaterialStateProperty.all<EdgeInsets>(
//                               EdgeInsets.symmetric(vertical: 20)),
//                         ),
//                         onPressed: () async {
//                           User? user = await signInWithEmailAndPassword(
//                               email: _emailController.text,
//                               password: _passwordController.text,
//                               context: context);
//                           print(user);
//                           if (user != null) {
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) => Newhomepage()));
//                           }
//                         },

//                         // if (_formKey.currentState!.validate()) {
//                         //   _ui.loadState(true);

//                         //   LoginScreen();

//                         // Navigator.pushNamed(
//                         //     context, MyRoutes.NewHomePageRoute);

//                         child: Text(
//                           "Log In",
//                           style: TextStyle(fontSize: 20),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Are you new? Create an account ",
//                         style: TextStyle(color: Colors.grey.shade800),
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Navigator.of(context).pushNamed("/signup");
//                           },
//                           child: Text(
//                             "Sign up",
//                             style: TextStyle(color: Colors.blue),
//                           ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // class ValidateLogin {
// //   static String? emailValidate(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return "Email is required";
// //     }

// //     return null;
// //   }

// //   static String? password(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return "Password is required";
// //     }
// //     return null;
// //   }
// // }
// //  bool _obscureTextPassword = true;

// //   final _formKey = GlobalKey<FormState>();

// //   void login() async {
// //     if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
// //       return;
// //     }
// //     _ui.loadState(true);
// //     try {
// //       var res = await _authViewModel
// //           .login(_emailController.text, _passwordController.text)
// //           .then((value) {
// //         NotificationService.display(
// //           title: "Welcome back",
// //           body:
// //               "Hello ${_authViewModel.loggedInUser?.fullName},\n Hope you are having a wonderful day.",
// //         );

// //         Navigator.of(context).pushReplacementNamed('/dashboard');
// //       }).catchError((e) {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text(e.toString())));
// //       });
// //       print(res);
// //     } catch (err) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text(err.toString())));
// //     }
// //     _ui.loadState(false);
// //   }

// //   late GlobalUIViewModel _ui;
// //   late AuthViewModel _authViewModel;