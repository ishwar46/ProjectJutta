import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/signup_page.dart';

void main() {
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
      initialRoute: "/signup",
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => SignUpPage(),
        MyRoutes.loginRoute: (context) => SignUpPage(),
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String signupRoute = "/signup";
}
