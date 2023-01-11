
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:jutta_junction/pages/signup_page.dart';



Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Myapp());
}



class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.system,
      //theme: MyTheme.lightTheme(context),
      //darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/login",
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {

        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),

        "/register":(BuildContext context) =>RegPage(),
        // "/": (context) => LoginPage(),
        // MyRoutes.loginRoute: (context) => LoginPage(),


      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String signupRoute = "/signup";
}
