import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_service.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  String? userId;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
    super.initState();
  }

  void editEmail() async {
    _ui.loadState(true);
    try {
      _authViewModel.user?.updateEmail(new_emailController.text);
      FirebaseService.db
          .collection("users")
          .where("user_id", isEqualTo: _authViewModel.user?.uid)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.set({
            "email": new_emailController.text,
          }, SetOptions(merge: true));
        });
      }).catchError((error) {
        print("Error updating email : $error");
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email updated")));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
    _ui.loadState(false);
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController new_emailController = TextEditingController();
  TextEditingController confirm_emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, authVM, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Change your Email'),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          color: Color(0xFFD6D6D6),
          child: ListView(
            children: [
              colorTiles(authVM),
            ],
          ),
        ),
        bottomNavigationBar: SubmitButtons(),
      );
    });
  }

  Widget colorTiles(AuthViewModel authVM) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Previous Email: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value != null || value!.isEmpty) {
                            final bool isValid = EmailValidator.validate(
                                emailController.text.trim());
                            if (!isValid) {
                              return "Invalid email";
                            }
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.purple,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.purple,
                            size: 25,
                          ),
                          hintText: "Previous email",
                          // hintText: "${authVM.loggedInUser?.email.toString()}",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black38)),
                        )),
                  ),
                ],
              ),
            ),
            divider(),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "New Email:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: TextFormField(
                        controller: new_emailController,
                        validator: (value) {
                          if (value != null || value!.isEmpty) {
                            final bool isValid = EmailValidator.validate(
                                new_emailController.text.trim());
                            if (!isValid) {
                              return "Invalid email";
                            }
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.purple,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.purple,
                            size: 25,
                          ),
                          hintText: "Enter your new email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black38)),
                        )),
                  ),
                ],
              ),
            ),
            divider(),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Confirm-Email:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: TextFormField(
                        controller: confirm_emailController,
                        validator: (value) {
                          if (value != null || value!.isEmpty) {
                            final bool isValid = EmailValidator.validate(
                                confirm_emailController.text.trim());
                            if (!isValid) {
                              return "Invalid email";
                            }
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.purple,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.purple,
                            size: 25,
                          ),
                          hintText: "Verify your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black38)),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SubmitButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            editEmail();
            // Add your code for logging out here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            "Submit",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
