import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jutta_junction/Dashboard/NewHomePage.dart';
import 'package:jutta_junction/pages/Profile/account_screen.dart';
import 'package:jutta_junction/pages/Profile/change_your_email.dart';
import 'package:jutta_junction/pages/Profile/edit_profile.dart';
import 'package:jutta_junction/pages/chatbot/ChatPage.dart';
import 'package:jutta_junction/pages/drawer/faq.dart';
import 'package:jutta_junction/pages/drawer/return_refund.dart';
import 'package:jutta_junction/pages/ChangePassword.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/onboarding_screen.dart';
import 'package:jutta_junction/pages/payment.dart';
import 'package:jutta_junction/pages/product_Detail/CartPage.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
import 'package:jutta_junction/pages/qr/qrhomepage.dart';
import 'package:jutta_junction/pages/review.dart';
import 'package:jutta_junction/pages/search.dart';
import 'package:jutta_junction/pages/signup_page.dart';
import 'package:jutta_junction/services/local_notification.dart';
import 'package:jutta_junction/viewmodels/auth_viewmodel.dart';
import 'package:jutta_junction/viewmodels/global_ui_viewmodel.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

//Global variable for the notification plugin
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // runApp(VxState(store: MyStore(), child: Myapp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService.initialize();
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

  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_5a22ad67e707441b8362fc7bed556a8d',
      enabledDebugging: true,
      builder: (context, navKey) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => GlobalUIViewModel()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ],
          child: GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: Image.asset(
                "assets/images/Jutta.png",
                height: 100,
                width: 100,
              ),
            ),
            child:
                Consumer<GlobalUIViewModel>(builder: (context, loader, child) {
              if (loader.isLoading) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }

              return MaterialApp(
                navigatorKey: navKey,
                localizationsDelegates: const [
                  KhaltiLocalizations.delegate,
                ],
                //home: HomePage(),
                themeMode: ThemeMode.system,

                //theme: MyTheme.lightTheme(context),
                //darkTheme: MyTheme.darkTheme(context),
                initialRoute: "/splash",
                debugShowCheckedModeBanner: false,
                // initialRoute: MyRoutes.homeRoute,
                routes: {
                  "/": (context) => Newhomepage(),
                  // MyRoutes.profileRoute: (context) => SettingsUI(),
                  MyRoutes.NewHomePageRoute: (context) => Newhomepage(),
                  MyRoutes.loginRoute: ((context) => LoginScreen()),
                  MyRoutes.loginRoute: ((context) => Card()),
                  // "/": (context) => SettingsUI(),
                  // MyRoutes.homepageRoute: ((context) => HomePage()),
                  MyRoutes.signupRoute: ((context) => RegisterScreen()),
                  MyRoutes.profileRoute: ((context) => AccountScreen()),
                  MyRoutes.chatRoute: ((context) => ChatPage()),
                  MyRoutes.faqRoute: ((context) => FaqPage()),
                  MyRoutes.refundRoute: ((context) => RedturnRefund()),
                  MyRoutes.onboardingRoute: ((context) => Onboarding()),
                  MyRoutes.qrRoute: ((context) => QrHomePage()),
                  MyRoutes.splashRoute: ((context) => Onboarding()),
                  MyRoutes.paymentRoute: ((context) => Payment()),
                  MyRoutes.CartPageRoute: ((context) => CartPage()),
                  MyRoutes.qrRoute: ((context) => QrHomePage()),
                  MyRoutes.searchRoute: ((context) => SearchPage()),
                  MyRoutes.ratingRoute: ((context) => UserRatingReview()),
                  MyRoutes.changepassRoute: ((context) => ChangePassword()),
                  MyRoutes.CartPageRoute: ((context) => CartPage()),
                  // profile ko routes
                  "/change_email": (BuildContext context) => ChangeEmail(),
                  "/your_profile": (BuildContext context) => ProfileInfo(),
                },
              );
            }),
          ),
        );
      },
    );
  }
}

class CategoryViewModel {}

class MyRoutes {
  static String NewHomePageRoute = "/NewHomePage";
  static String searchRoute = "/searchPage";
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String qrRoute = "/qr";
  static String splashRoute = "/splash";
  static String paymentRoute = "/payment";
  static String profileRoute = "/profile";
  static String signupRoute = "/signup";
  static String homepageRoute = "/HomePage";
  static String Product_detailRoute = "/Product_detail";
  static String CartPageRoute = "/CartPage";
  static String chatRoute = "/chatpage";
  static String faqRoute = "/faqpage";
  static String refundRoute = "/returnrefundRoute";
  static String onboardingRoute = "/onboardingRoute";
  static String changepassRoute = "/changepassRoute";
  static String ratingRoute = "/ratingRoute";

  // static String onboardingRoute = "/onboardingRoute";
  // static String changepassRoute = "/changepassRoute";
}
