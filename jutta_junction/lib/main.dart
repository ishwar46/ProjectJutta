import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jutta_junction/pages/chatbot/ChatPage.dart';
import 'package:jutta_junction/pages/drawer/faq.dart';
import 'package:jutta_junction/pages/drawer/return_refund.dart';
import 'package:jutta_junction/pages/edit_profile.dart';
import 'package:jutta_junction/pages/home_page.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/signup_page.dart';

//Global variable for the notification plugin
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/jutta');

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

//background notification
  bool? initialized = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
  });

  log("Notofication: $initialized");
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
      initialRoute: "/HomePage",
      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homepageRoute: (context) => HomePage(),
        MyRoutes.loginRoute: ((context) => LoginPage()),
        MyRoutes.homepageRoute: ((context) => HomePage()),
        MyRoutes.signupRoute: ((context) => RegPage()),
        MyRoutes.profileRoute: ((context) => EditProfilePage()),
        MyRoutes.chatRoute: ((context) => ChatPage()),
        MyRoutes.faqRoute: ((context) => FaqPage()),
        MyRoutes.refundRoute: ((context) => RedturnRefund()),
      },
    );
  }
}

class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String signupRoute = "/signup";
  static String homepageRoute = "/HomePage";
  static String Product_detailRoute = "/Product_detail";
  static String profileRoute = "/profilepage";
  static String chatRoute = "/chatpage";
  static String faqRoute = "/faqpage";
  static String refundRoute = "/returnrefundRoute";
}
