// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/Dashboard/NewHomePage.dart';
import 'package:jutta_junction/pages/drawer/faq.dart';
import 'package:jutta_junction/pages/drawer/return_refund.dart';
import 'package:jutta_junction/pages/home_page.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/dashboard.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
import 'package:jutta_junction/pages/product_Detail/cart.dart';
import 'package:jutta_junction/pages/slider.dart';

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
      initialRoute: "/Newhomepage",
       
      

      // debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/Newhomepage":(BuildContext context)=>Newhomepage(),
        "/Product_detail":(BuildContext context)=>const Product_detail(),
        // "/Cart":(BuildContext context)=>const Cart(),
        // "/task":(BuildContext context) => HomeScreen(),
        // MyRoutes.Product_detailRoute: (context) => const Product_detail(),
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String NewhomepageRoute = "/Newhomepage";
  static String Product_detailRoute="/Product_detail";
   static String CartRoute="/Cart";
}
