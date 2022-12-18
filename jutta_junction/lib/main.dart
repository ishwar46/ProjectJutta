import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'dart:ui';

import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';

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
      initialRoute: "/login",
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Product_detail(),
        //MyRoutes.loginRoute: (context) => LoginPage(),
      MyRoutes.productRoute: (context) => Product_detail(),        
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String productRoute = "/product";
}
