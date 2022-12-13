import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/signup_page.dart';
import 'package:jutta_junction/pages/test/landingpage.dart';
import 'package:jutta_junction/pages/test/login_new.dart';
import 'pages/home_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const Myapp());
// }

void main(List<String> args) {
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
        "/": (context) => LandingPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        //MyRoutes.loginewRoute: (context) => LoginScreen(),
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String signupRoute = "/signup";
  static String loginewRoute = "/loginnew";
  static String landingRoute = "/landing";
}
