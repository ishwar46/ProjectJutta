// import 'dart:convert';
// import 'dart:developer';


// // import 'package:carousel_slider/carousel_controller.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:jutta_junction/Dashboard/ItemCart.dart';
// import 'package:jutta_junction/Dashboard/Product.dart';
// import 'package:jutta_junction/main.dart';
// import 'package:jutta_junction/models/product_model.dart';
// import 'package:jutta_junction/pages/edit_profile.dart';
// import 'package:jutta_junction/pages/login_page.dart';
// import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
// import 'package:jutta_junction/pages/qr/qrhomepage.dart';
// import 'package:jutta_junction/pages/qr/scanqr.dart';
// // import 'package:jutta_junction/pages/search.dart';
// import 'package:velocity_x/velocity_x.dart';
// //import products.dart';
// import 'package:jutta_junction/models/product_model.dart';

// import '../models/catelog.dart';
// import 'package:like_button/like_button.dart';


// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int activeIndex = 0;

//   //Widget for Featured Product
//   Widget _buildFeatureProduct(
//       {required String name, required double price, required String image}) {
//     return Card(
//       //container
//       child: Container(
//         height: 200,
//         width: 150,
//         child: Column(
//           children: <Widget>[
          
           
//             InkWell(
//                 //  onTap: () {
//                 //             Navigator.push(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                 // builder: (context) => const Product_detail(),
//                 //               ),
//                 //             );
//                 //           },
//               child: Container(
//                 height: 120,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/$image"),
//                   ),
//                 ),
//                 //like button
//                 child: Padding(
//                   padding: EdgeInsets.only(bottom: 90, left: 75),
//                   child: LikeButton(
//                     size: 20,
//                     circleColor: CircleColor(
//                         start: Color(0xff00ddff), end: Color(0xff0099cc)),
//                     bubblesColor: BubblesColor(
//                       dotPrimaryColor: Color(0xff33b5e5),
//                       dotSecondaryColor: Color(0xff0099cc),
//                     ),
//                     likeBuilder: (bool isLiked) {
//                       return Icon(
//                         Icons.favorite,
//                         color: isLiked
//                             ? Color.fromARGB(255, 255, 0, 0)
//                             : Colors.grey,
//                         size: 20,
//                       );
//                     },
//                     //"like count backend code"
//                     likeCount: 69,
//                     //  countBuilder: (int count, bool isLiked, String text) {
//                     //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
//                     //   Widget result;
//                     //   if (count == 0) {
//                     //     result = Text(
//                     //       "love",
//                     //       style: TextStyle(color: color),
//                     //     );
//                     //   } else
//                     //     result = Text(
//                     //       text,
//                     //       style: TextStyle(color: color),
//                     //     );
//                     //   return result;
//                     // },
//                   ),
//                 ),
            
//                 // child: new IconButton(
//                 // padding: EdgeInsets.only(left: 110, top: 10, bottom:80),
//                 //   icon: Icon(Icons.favorite_border),
            
//                 //   onPressed: (() {Icon(Icons.favorite,color: Colors.red,size:30,);
            
//                 //   }),
//                 // ),
//               ),
//             ),
//             Text(
//               "Rs. $price",
//               style: TextStyle(
//                   color: Color(0xff9b96d6),
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               name,
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//             ),
           
//             //   icon: Icon(Icons.check),
//             //   onPressed: (() {}),
//             // ),
//           ],
          
//         ),
        
     
      
//       ),
     
         
//     );
//   }

//   //Widget for Brands
//   Widget _buildBrands(String image) {
//     return CircleAvatar(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       maxRadius: 40,
//       child: Container(
//         height: 75,
//         child: Image(
//           image: AssetImage("assets/images/$image"),
//         ),
//       ),
//     );
//   }

//   //Widget for New Arrivals
//   Widget _buildNewArrivals(
//       {required String name, required double price, required String image}) {
//     return Card(
      
//       // child: Container(
//       //   height: 200,
//       //   width: 150,
        
//       //   child: Column(
//       //     children: <Widget>[
            
//       //       InkWell(
//       //         onTap: () {
//       //                       Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                           builder: (context) => const Product_detail(),
//       //                         ),
//       //                       );
//       //                     },
//       //         child: Container(
//       //           height: 120,
//       //           width: 120,
//       //           decoration: BoxDecoration(
//       //             image: DecorationImage(
//       //               image: AssetImage("assets/images/$image"),
//       //             ),
//       //           ),
//       //         ),
//       //       ),
//             // Text(
//             //   "Rs. $price",
//             //   style: TextStyle(
//             //       color: Color(0xff9b96d6),
//             //       fontSize: 12,
//             //       fontWeight: FontWeight.bold),
//             // ),
//       //       Text(
//       //         name,
//       //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//       //       ),
//       //       // IconButton(
//       //       //   icon: Icon(Icons.check),
//       //       //   onPressed: (() {}),
//       //       // ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }

//   // Widget _buildSearchBar() {
//   //   return Container(
//   //     height: 50,
//   //     width: 350,
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.circular(10),
//   //     ),
//   //     child: TextField(
//   //       decoration: InputDecoration(
//   //         hintText: "Search",
//   //         hintStyle: TextStyle(color: Colors.grey),
//   //         border: InputBorder.none,
//   //         prefixIcon: Icon(
//   //           Icons.search,
//   //           color: Colors.grey,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // static List<ProductModel> products_details = [
//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

//   //List<ProductModel> _searchResult = List.from(products_details);
//   void updateList(String value) {
//     // this is the function that will filter our list
//   }

//   //User SignOut
//   void SignUserOut() async {
//     await FirebaseAuth.instance.signOut(
//         //show loading dialog
//         );
//   }

//   //method for notification
//   void showNotification() async {
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       importance: Importance.max,
//       priority: Priority.max,
//       ticker: "test",
//       enableLights: true,
//       enableVibration: true,
//     );

//     //for ios
//     DarwinNotificationDetails darwinNotificationDetails =
//         DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       "Jutta Junction",
//       "Welcome to Jutta Junction",
//       notificationDetails,
//     );

//     DateTime time = DateTime.now().add(Duration(seconds: 10));
//     //time based notification
//     await flutterLocalNotificationsPlugin.schedule(
//         0, "New Year Sale", "Nike Blazers Mid 77", time, notificationDetails,
//         payload: "ok");
//   }

//   //App launch notification
//   void checkForNotification() async {
//     NotificationAppLaunchDetails? details =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     if (details != null) {
//       if (details.didNotificationLaunchApp) {
//         NotificationResponse? response = details.notificationResponse;
//         if (response != null) {
//           String? payload = response.payload;
//           log("Noitification payload: $payload");
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkForNotification();
//     showNotification();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.chat),
//         backgroundColor: Colors.grey,
//         onPressed: () {
//           Navigator.pushNamed(context, MyRoutes.chatRoute);
//         },
//       ),
//       backgroundColor: Colors.white,
//       key: _key,
//       //Drawer Section
//       drawer: Drawer(
//         backgroundColor: Color.fromARGB(255, 0, 0, 0),
//         child: ListView(
//           children: [
//             DrawerHeader(
//               child: Column(
//                 children: const [
//                   SizedBox(height: 10),
//                   Center(
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/images/Jutta.png'),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text("Jutta Junction",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                   Text("support.juttaj@gmail.com",
//                       style: TextStyle(fontSize: 15, color: Colors.white)),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             const Divider(
//                 thickness: 1, color: Color.fromARGB(255, 255, 255, 255)),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.person),
//               title: const Text('My Profile',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         SettingsUI(),
//                                   ),
//                                 );
//             },
//             ),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.question_answer),
//               title: const Text('FAQ', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pushNamed(context, MyRoutes.faqRoute);
//               },
//             ),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.assignment_return_rounded),
//               title: const Text('Refund & Return',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pushNamed(context, "/returnrefundRoute");
//               },
//             ),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.help_outline),
//               title: const Text('Help Center',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Help Center'),
//                         content: const Text('No Help Center Available'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.logout_outlined),
//               title:
//                   const Text('Logout', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Logout'),
//                         content: const Text('Are you sure you want to logout?'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               SignUserOut();
//                               Navigator.push(
//             context,
//               MaterialPageRoute(
//                 builder: (context)=>LoginPage(),
//               )
//              ); 
//                             },
//                             child: Text("Sign Out"),
//                           ),
//                           TextButton(
//                             child: const Text('No'),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//             ListTile(
//               iconColor: Colors.white,
//               leading: const Icon(Icons.info_outline),
//               title:
//                   const Text('About Us', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 showAboutDialog(
//                     context: context,
//                     applicationName: 'Jutta Junction',
//                     applicationVersion: '1.0.0',
//                     applicationIcon: const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/images/Jutta.png'),
//                     ),
//                     children: [
//                       const Text(
//                           'Jutta Junction is a platform for all your footwear needs. We provide you with the best quality footwear at the best prices. We have a wide range of products from all the top brands. We also provide you with the best customer service. We are always here to help you out with any queries you may have. We hope you enjoy your shopping experience with us.'),
//                     ]);
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 60,
//         backgroundColor: Color.fromARGB(255, 2, 5, 8),
//         color: Color.fromARGB(255, 255, 255, 255),
//         //IconButtons
//         items: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pushNamed(context, MyRoutes.homeRoute);
//             },
//           ),
    
//           IconButton(
//             icon: Icon(
//               Icons.shopping_cart,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               // Navigator.pushNamed(context, MyRoutes.CartRoute);
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.person,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               // Navigator.pushNamed(context, MyRoutes.loginRoute);                                 
//             },
//           ),
//         ],
//       ),
//       //App Bar
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/juttanew.png",
//               fit: BoxFit.contain,
//               height: 150,
//             ),
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             _key.currentState?.openDrawer();
//           },
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.notifications_none,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               showNotification();
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.qr_code_sharp,
//               color: Colors.black,
//             ),
//             onPressed: () {
//              Navigator.push(
//               context,
//                 MaterialPageRoute(
//                   builder: (context) =>qrhomepage(),
//                   ),
//               );
//             },
//           ),
//         ],
//       ),
//       resizeToAvoidBottomInset: false,
//       //Body Area Started
//       body: SafeArea(
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: ListView(
//             children: [
//               Column(
//                 children: <Widget>[
//                   Container(
//                     height: 120,
//                     width: double.infinity,
//                     //color: Colors.purple,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         TextField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             prefixIcon: Icon(Icons.search),
//                             hintText: "The best shoes for best people.",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         // const SizedBox(
//                         //   height: 10,
//                         // ),
//                         // Expanded(
//                         //   child: ListView.builder(
//                         //     itemCount: _searchResult.length,
//                         //     itemBuilder: (context, index) => ListTile(
//                         //       title: Text(
//                         //         _searchResult[index].productName!,
//                         //         style: TextStyle(
//                         //           color: Colors.black,
//                         //           fontWeight: FontWeight.bold,
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         Container(
//                           height: 50,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Featured",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "See all",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   //Featured Products
//                 //   Row(
//                 //     children: <Widget>[
//                 //        SingleChildScrollView(
//                 //     // physics: BouncingScrollPhysics(),
//                 //     scrollDirection: Axis.horizontal,
//                 //     child: Row(
//                 //       children: <Widget>[
//                 //               ListView.builder(
//                 //                   itemCount: product1.length,
//                 //                   itemBuilder: ((context, index) =>ItemCart(product: product1[index]))
//                 //                   )
//                 //               ],
                      
//                 //     ),
//                 //   ),

//                 //     ],
//                 //   )
//                 //  ,
//                   Container(
//                     height: 50,
//                     //color: Colors.amber,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text(
//                           "Brands",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "See all",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     child: Container(
//                       height: 100,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           _buildBrands("nikelogo.png"),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           _buildBrands("adidaslogo.png"),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           _buildBrands("convlogo.png"),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           _buildBrands("drmartenslogo.png"),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           _buildBrands("nikelogo.png"),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           _buildBrands("adidaslogo.png"),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           _buildBrands("convlogo.png"),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           _buildBrands("drmartenslogo.png"),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   List.generate(
//                       10,
//                       (index) => "Product $index"
//                           .text
//                           .white
//                           .make()
//                           .box
//                           .rounded
//                           .alignCenter
                          
//                           .color(Vx.randomOpaqueColor)
//                           .make()
//                           .p4()).swiper(
//                       height: context.isMobile ? 100 : 200,
//                       enlargeCenterPage: true,
//                       viewportFraction: context.isMobile ? 0.8 : 0.4,
//                       autoPlay: true,
//                       isFastScrollingEnabled: true,
//                       scrollDirection:
//                           context.isMobile ? Axis.horizontal : Axis.horizontal),
//                   Container(
//                     height: 50,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "New arrivals",
//                               style: TextStyle(
//                                   fontSize: 17, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "See all",
//                               style: TextStyle(
//                                   fontSize: 17, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // New Arrivals
//                   SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: <Widget>[
//                                 _buildNewArrivals(
//                                     image: "nb550.png",
//                                     price: 9000,
//                                     name: "New Balance 550"),
//                                 _buildNewArrivals(
//                                     image: "vegan_black.png",
//                                     price: 9000,
//                                     name: "DR Martens Vegan Black"),
//                                 _buildNewArrivals(
//                                     image: "stan.png",
//                                     price: 9000,
//                                     name: "Stan Smith"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class HomePageNew extends StatefulWidget {
// //   const HomePageNew({super.key});

// //   @override
// //   State<HomePageNew> createState() => _HomePageNewState();
// // }
// // int activeIndex = 0;
// //   //Widget for Featured Product
// //   Widget _buildFeatureProduct(
// //       {required String name, required double price, required String image}) {
// //     return Card(
// //       child: Container(
// //         height: 200,
// //         width: 150,
// //         child: Column(
// //           children: <Widget>[
// //             Container(
// //               height: 120,
// //               width: 120,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage("assets/images/$image"),
// //                 ),
// //               ),
// //               child: IconButton(
// //                 padding: EdgeInsets.only(left: 100, top: 10),
// //                 icon: Icon(Icons.favorite_border),
// //                 onPressed: (() {}),
// //               ),
// //             ),
// //             Text(
// //               "Rs. $price",
// //               style: TextStyle(
// //                   color: Color(0xff9b96d6),
// //                   fontSize: 12,
// //                   fontWeight: FontWeight.bold),
// //             ),
// //             Text(
// //               name,
// //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
// //             ),
// //             // IconButton(
// //             //   icon: Icon(Icons.check),
// //             //   onPressed: (() {}),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   //Widget for Brands
// //   Widget _buildBrands(String image) {
// //     return CircleAvatar(
// //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
// //       maxRadius: 40,
// //       child: Container(
// //         height: 75,
// //         child: Image(
// //           image: AssetImage("assets/images/$image"),
// //         ),
// //       ),
// //     );
// //   }

// //   //Widget for New Arrivals

// //   Widget _buildNewArrivals(
// //       {required String name, required double price, required String image}) {
// //     return Card(
// //       child: Container(
// //         height: 200,
// //         width: 150,
// //         child: Column(
// //           children: <Widget>[
// //             Container(
// //               height: 120,
// //               width: 120,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage("assets/images/$image"),
// //                 ),
// //               ),
// //             ),
// //             Text(
// //               "Rs. $price",
// //               style: TextStyle(
// //                   color: Color(0xff9b96d6),
// //                   fontSize: 12,
// //                   fontWeight: FontWeight.bold),
// //             ),
// //             Text(
// //               name,
// //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
// //             ),
// //             // IconButton(
// //             //   icon: Icon(Icons.check),
// //             //   onPressed: (() {}),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   //Search Bar Suggestions

// //   final List<String> _suggestions = [
// //     'Nike',
// //     'Adidas',
// //     'Puma',
// //     'Reebok',
// //     'Fila',
// //     'New Balance',
// //     'Under Armour',
// //     'Asics',
// //     'Vans',
// //   ];

// //   // static List<ProductModel> products_details = [
// //   //   ProductModel(
// //   //     "Nike Air Max 270",
// //   //     10000,
// //   //   ),
// //   //   ProductModel(
// //   //     "Nike Air Max 280",
// //   //     10000,
// //   //   ),
// //   //   ProductModel(
// //   //     "Nike Air Max 290",
// //   //     10000,
// //   //   ),
// //   // ];

// //   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

// //   //List<ProductModel> _searchResult = List.from(products_details);

// //   void updateList(String value) {
// //     // this is the function that will filter our list
// //   }

// // class _HomePageNewState extends State<HomePageNew> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.chat),
// //         backgroundColor: Colors.grey,
// //         onPressed: () {
// //           Navigator.pushNamed(context, MyRoutes.loginRoute);
// //         },
// //       ),
// //       backgroundColor: Colors.white,
// //       key: _key,
// //       //Drawer Section
// //       drawer: Drawer(
// //         backgroundColor: Color.fromARGB(255, 0, 0, 0),
// //         child: ListView(
// //           children: [
// //             DrawerHeader(
// //               child: Column(
// //                 children: const [
// //                   SizedBox(height: 10),
// //                   Center(
// //                     child: CircleAvatar(
// //                       radius: 30,
// //                       backgroundImage: AssetImage('assets/images/Jutta.png'),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text("Jutta Junction",
// //                       style: TextStyle(fontSize: 20, color: Colors.white)),
// //                   Text("support.juttaj@gmail.com",
// //                       style: TextStyle(fontSize: 20, color: Colors.white)),
// //                 ],
// //               ),
// //             ),
// //             const Divider(
// //                 thickness: 1, color: Color.fromARGB(255, 255, 255, 255)),
// //             ListTile(
// //               iconColor: Colors.white,
// //               leading: const Icon(Icons.person),
// //               title: const Text('My Profile',
// //                   style: TextStyle(color: Colors.white)),
// //               onTap: () {
// //                 Navigator.pushNamed(context, MyRoutes.loginRoute);
// //               },
// //             ),
// //             ListTile(
// //               iconColor: Colors.white,
// //               leading: const Icon(Icons.category),
// //               title:
// //                   const Text('Brands', style: TextStyle(color: Colors.white)),
// //               onTap: () {
// //                 // Add Navigation logic here
// //               },
// //             ),
// //             ListTile(
// //               iconColor: Colors.white,
// //               leading: const Icon(Icons.wallet_giftcard_rounded),
// //               title:
// //                   const Text('Offers', style: TextStyle(color: Colors.white)),
// //               onTap: () {
// //                 // Add Navigation logic here
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: CurvedNavigationBar(
// //         height: 60,
// //         backgroundColor: Color.fromARGB(255, 2, 5, 8),
// //         color: Color.fromARGB(255, 255, 255, 255),
// //         //IconButtons
// //         items: <Widget>[
// //           IconButton(
// //             icon: Icon(
// //               Icons.home,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {
// //               Navigator.pushNamed(context, MyRoutes.homeRoute);
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.search,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {
// //               //Navigator.pushNamed(context, MyRoutes.searchRoute);
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.shopping_cart,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {
// //               //Navigator.pushNamed(context, MyRoutes.cartRoute);
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.person,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {
// //               Navigator.pushNamed(context, MyRoutes.loginRoute);
// //             },
// //           ),
// //         ],
// //       ),
// //       //App Bar
// //       appBar: AppBar(
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Image.asset(
// //               "assets/images/juttanew.png",
// //               fit: BoxFit.contain,
// //               height: 120,
// //             ),
// //           ],
// //         ),
// //         centerTitle: true,
// //         elevation: 0.0,
// //         backgroundColor: Color.fromARGB(255, 255, 255, 255),
// //         leading: IconButton(
// //           icon: Icon(
// //             Icons.menu,
// //             color: Colors.black,
// //           ),
// //           onPressed: () {
// //             _key.currentState?.openDrawer();
// //           },
// //         ),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(
// //               Icons.notifications_none,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {},
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.qr_code_sharp,
// //               color: Colors.black,
// //             ),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       resizeToAvoidBottomInset: false,
// //       //Body Area Started
// //       body: SafeArea(
// //         child: Container(
// //           height: double.infinity,
// //           width: double.infinity,
// //           margin: EdgeInsets.symmetric(horizontal: 20),
// //           child: ListView(
// //             children: [
// //               Column(
// //                 children: <Widget>[
// //                   Container(
// //                     height: 120,
// //                     width: double.infinity,
// //                     //color: Colors.purple,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: <Widget>[
// //                         TextField(
// //                           decoration: InputDecoration(
// //                             filled: true,
// //                             prefixIcon: Icon(Icons.search),
// //                             hintText: "The best shoes for best people.",
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(10),
// //                               borderSide: BorderSide.none,
// //                             ),
// //                           ),
// //                         ),
// //                         // const SizedBox(
// //                         //   height: 10,
// //                         // ),
// //                         // Expanded(
// //                         //   child: ListView.builder(
// //                         //     itemCount: _searchResult.length,
// //                         //     itemBuilder: (context, index) => ListTile(
// //                         //       title: Text(
// //                         //         _searchResult[index].productName!,
// //                         //         style: TextStyle(
// //                         //           color: Colors.black,
// //                         //           fontWeight: FontWeight.bold,
// //                         //         ),
// //                         //       ),
// //                         //     ),
// //                         //   ),
// //                         // ),
// //                         Container(
// //                           height: 50,
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.end,
// //                             children: <Widget>[
// //                               Row(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   Text(
// //                                     "Featured",
// //                                     style: TextStyle(
// //                                         fontSize: 17,
// //                                         fontWeight: FontWeight.bold),
// //                                   ),
// //                                   Text(
// //                                     "See all",
// //                                     style: TextStyle(
// //                                         fontSize: 17,
// //                                         fontWeight: FontWeight.bold),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   SingleChildScrollView(
// //                     scrollDirection: Axis.horizontal,
// //                     child: Row(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Row(
// //                               children: <Widget>[
// //                                 _buildFeatureProduct(
// //                                     image: "nike.png",
// //                                     price: 9000,
// //                                     name: "Nike Blazers Mid '77"),
// //                                 _buildFeatureProduct(
// //                                     image: "jordan.jpg",
// //                                     price: 9000,
// //                                     name: "Jordan University Blue"),
// //                                 _buildFeatureProduct(
// //                                     image: "converse.png",
// //                                     price: 9000,
// //                                     name: "Converse High"),
// //                                 _buildFeatureProduct(
// //                                     image: "vegan_black.png",
// //                                     price: 12000,
// //                                     name: "Dr. Martens Vegan Black"),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 50,
// //                     //color: Colors.amber,
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: const [
// //                         Text(
// //                           "Brands",
// //                           style: TextStyle(
// //                               fontSize: 16, fontWeight: FontWeight.bold),
// //                         ),
// //                         Text(
// //                           "See all",
// //                           style: TextStyle(
// //                               fontSize: 16, fontWeight: FontWeight.bold),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   SingleChildScrollView(
// //                     scrollDirection: Axis.horizontal,
// //                     child: Container(
// //                       height: 100,
// //                       child: Row(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: <Widget>[
// //                           _buildBrands("nikelogo.png"),
// //                           const SizedBox(
// //                             width: 5,
// //                           ),
// //                           _buildBrands("adidaslogo.png"),
// //                           const SizedBox(
// //                             width: 20,
// //                           ),
// //                           _buildBrands("convlogo.png"),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           _buildBrands("drmartenslogo.png"),
// //                           SizedBox(
// //                             width: 5,
// //                           ),
// //                           _buildBrands("nikelogo.png"),
// //                           SizedBox(
// //                             width: 5,
// //                           ),
// //                           _buildBrands("adidaslogo.png"),
// //                           SizedBox(
// //                             width: 20,
// //                           ),
// //                           _buildBrands("convlogo.png"),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           _buildBrands("drmartenslogo.png"),
// //                           SizedBox(
// //                             width: 5,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   List.generate(
// //                       10,
// //                       (index) => "Item $index"
// //                           .text
// //                           .white
// //                           .make()
// //                           .box
// //                           .rounded
// //                           .alignCenter
// //                           .color(Vx.randomOpaqueColor)
// //                           .make()
// //                           .p4()).swiper(
// //                       height: context.isMobile ? 100 : 200,
// //                       enlargeCenterPage: true,
// //                       viewportFraction: context.isMobile ? 0.8 : 0.4,
// //                       autoPlay: true,
// //                       isFastScrollingEnabled: true,
// //                       scrollDirection:
// //                           context.isMobile ? Axis.horizontal : Axis.horizontal),
// //                   Container(
// //                     height: 50,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: <Widget>[
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text(
// //                               "New arrivals",
// //                               style: TextStyle(
// //                                   fontSize: 17, fontWeight: FontWeight.bold),
// //                             ),
// //                             Text(
// //                               "See all",
// //                               style: TextStyle(
// //                                   fontSize: 17, fontWeight: FontWeight.bold),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20,
// //                   ), ////
// //                   SingleChildScrollView(
// //                     scrollDirection: Axis.horizontal,
// //                     child: Row(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Row(
// //                               children: <Widget>[
// //                                 _buildNewArrivals(
// //                                     image: "nb550.png",
// //                                     price: 9000,
// //                                     name: "New Balance 550"),
// //                                 _buildNewArrivals(
// //                                     image: "vegan_black.png",
// //                                     price: 9000,
// //                                     name: "DR Martens Vegan Black"),
// //                                 _buildNewArrivals(
// //                                     image: "stan.png",
// //                                     price: 9000,
// //                                     name: "Stan Smith"),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
