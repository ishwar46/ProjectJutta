import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/drawer/faq.dart';
import 'package:jutta_junction/pages/drawer/return_refund.dart';
import 'package:jutta_junction/pages/home_page.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/dashboard.dart';
import 'package:jutta_junction/pages/slider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Myapp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
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
      initialRoute: "/homepage",
      debugShowCheckedModeBanner: false,
      //initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homepageRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.returnrefundRoute: (context) => const RedturnRefund(),
        MyRoutes.faqRoute: (context) => FaqPage(),
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String homepageRoute = "/homepage";
  static String returnrefundRoute = "/returnrefund";
  static String faqRoute = "/faq";
}
