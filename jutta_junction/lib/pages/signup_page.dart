// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:jutta_junction/main.dart';
// import 'package:jutta_junction/pages/login_page.dart';
// import 'package:jutta_junction/pages/test/landingpage.dart';
// import 'package:provider/provider.dart';

// import '../models/user_model.dart';
// import '../services/local_notification.dart';
// import '../viewmodels/auth_viewmodel.dart';
// import '../viewmodels/global_ui_viewmodel.dart';

// class RegPage extends StatefulWidget {
//   const RegPage({super.key});

//   @override
//   State<RegPage> createState() => _RegPageState();
// }

// class _RegPageState extends State<RegPage> {
//   TextEditingController fullName = new TextEditingController();
//   TextEditingController username = new TextEditingController();
//   TextEditingController password = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//   TextEditingController phonenumber = new TextEditingController();
//   TextEditingController confirmpassword = new TextEditingController();
//   bool _obscureTextPassword = true;
//   bool _obscureTextPasswordConfirm = true;

//   late GlobalUIViewModel _ui;
//   late AuthViewModel _authViewModel;

//   @override
//   void initState() {
//     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//     _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//     super.initState();
//   }

//   void register() async {
//     if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
//       return;
//     }
//     _ui.loadState(true);
//     try {
//       await _authViewModel
//           .register(UserModel(
//               email: email.text,
//               password: password.text,
//               phone: phonenumber.text,
//               username: username.text,
//               fullName: fullName.text))
//           .then((value) {
//         NotificationService.display(
//           title: "Welcome to this app",
//           body:
//               "Hello ${_authViewModel.loggedInUser?.fullName},\n Thank you for registering in this application.",
//         );
//         Navigator.of(context).pushReplacementNamed("/dashboard");
//       }).catchError((e) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(e.message.toString())));
//       });
//     } catch (err) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(err.toString())));
//     }
//     _ui.loadState(false);
//   }

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color.fromARGB(255, 109, 146, 189),
//       body: Stack(
//         children: [
//           // Image.asset(
//           //   "assets/images/background.png",
//           //   fit: BoxFit.fill,
//           //   height: MediaQuery.of(context).size.height,
//           // ),
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Sign Up",
//                     style: Theme.of(context).textTheme.headline4!.copyWith(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     "Sign up to Jutta Junction to get started.",
//                     style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: fullName,
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Full Name",
//                               hintText: "Enter your full name",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Full Name cannot be empty";
//                               }

//                               return null;
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             controller: password,
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Password",
//                               hintText: "Enter your password",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Password cannot be empty";
//                               } else if (value.length < 6) {
//                                 return "Password length should be atleast 6 charachter";
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             controller: confirmpassword,
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Confirm Password",
//                               hintText: "Enter your password",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Password cannot be empty";
//                               } else if (value.length < 6) {
//                                 return "Password length should be atleast 6 charachter";
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             controller: email,
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Email",
//                               hintText: "Enter your email address",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Email cannot be empty";
//                               } else if (!value.contains("@")) {
//                                 return "Please enter a valid email address";
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             style: TextStyle(color: Colors.black),
//                             controller: phonenumber,
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Phone Number",
//                               hintText: "Enter your phone number",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Phone Number cannot be empty";
//                               } else if (value.length < 10) {
//                                 return "Please enter a valid phone number";
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             controller: username,
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 3,
//                                   color: Colors.white54,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               labelText: "Username",
//                               hintText: "Enter your username",
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Username cannot be empty";
//                               } else if (value.length < 6) {
//                                 return "Username length should be atleast 6 charachter";
//                               }

//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 30.0,
//                           ),
//                           FloatingActionButton.extended(
//                             label: Text('Signup'),
//                             backgroundColor: Colors.deepPurple.shade300,
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 register();
//                               } else {
//                                 print("fail");
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Already have an account ? ",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 14,
//                                     color: Colors.white),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (_) => const LoginScreen()));
//                                 },
//                                 child: Text(
//                                   "Signin ",
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/models/user_model.dart';
import 'package:jutta_junction/services/local_notification.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _gender = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void register() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _ui.loadState(true);
    try {
      await _authViewModel
          .register(UserModel(
              email: _emailController.text,
              password: _passwordController.text,
              phone: _phoneNumberController.text,
              username: _usernameController.text,
              fullName: _nameController.text))
          .then((value) {
        NotificationService.display(
          title: "Welcome to this app",
          body:
              "Hello ${_authViewModel.loggedInUser?.fullName},\n Thank you for registering in this application.",
        );
        Navigator.of(context).pushReplacementNamed("/dashboard");
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Jutta.png",
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: ValidateSignup.name,
                    keyboardType: TextInputType.name,
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
                        Icons.person,
                        color: Colors.black,
                        size: 22.0,
                      ),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: ValidateSignup.phone,
                    keyboardType: TextInputType.phone,
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
                        Icons.phone,
                        color: Colors.black,
                        size: 22.0,
                      ),
                      hintText: 'Address',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: ValidateSignup.username,
                    keyboardType: TextInputType.text,
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
                        Icons.verified_user,
                        color: Colors.black,
                        size: 22.0,
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidateSignup.emailValidate,
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
                    validator: (String? value) => ValidateSignup.password(
                        value, _confirmPasswordController),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureTextPasswordConfirm,
                    validator: (String? value) =>
                        ValidateSignup.password(value, _passwordController),
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
                        Icons.lock_clock,
                        size: 22.0,
                        color: Colors.black,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextPasswordConfirm =
                                !_obscureTextPasswordConfirm;
                          });
                        },
                        child: Icon(
                          _obscureTextPasswordConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                          register();
                        },
                        child: Text(
                          "Sign Up",
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
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Sign in",
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

class ValidateSignup {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? emailValidate(String? value) {
    final RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!emailValid.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  static String? password(String? value, TextEditingController otherPassword) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password should be at least 8 character";
    }
    if (otherPassword.text != value) {
      return "Please make sure both the password are the same";
    }
    return null;
  }
}
