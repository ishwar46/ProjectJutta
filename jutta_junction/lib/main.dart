import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/drawer/faq.dart';
import 'package:jutta_junction/pages/drawer/return_refund.dart';
import 'package:jutta_junction/pages/home_page.dart';
import 'package:jutta_junction/pages/khalti_payment.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(const Myapp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_5a22ad67e707441b8362fc7bed556a8d',
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
            navigatorKey: navKey,
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
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
              MyRoutes.khaltiRoute: (context) => const KhaltiPay(),
            },
          );
        });
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homepageRoute = "/homepage";
  static String returnrefundRoute = "/returnrefund";
  static String faqRoute = "/faq";
  static String khaltiRoute = "/khalti";
}
