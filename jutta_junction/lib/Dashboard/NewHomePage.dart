import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jutta_junction/Dashboard/ItemCart.dart';
import 'package:jutta_junction/Dashboard/Product.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main.dart';

class Newhomepage extends StatefulWidget {
  const Newhomepage({super.key});

  @override
  State<Newhomepage> createState() => _NewhomepageState();
}

Widget _buildBrands(String image) {
  return CircleAvatar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    maxRadius: 40,
    child: Container(
      height: 75,
      child: Image(
        image: AssetImage("assets/images/$image"),
      ),
    ),
  );
}

class _NewhomepageState extends State<Newhomepage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void updateList(String value) {
    // this is the function that will filter our list
  }

  //User SignOut
  void SignUserOut() async {
    await FirebaseAuth.instance.signOut(
        //show loading dialog
        );
  }

  //method for notification
  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.max,
      ticker: "test",
      enableLights: true,
      enableVibration: true,
    );

    //for ios
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      "Jutta Junction",
      "Welcome to Jutta Junction",
      notificationDetails,
    );

    DateTime time = DateTime.now().add(Duration(seconds: 10));
    //time based notification
    await flutterLocalNotificationsPlugin.schedule(
        0, "New Year Sale", "Nike Blazers Mid 77", time, notificationDetails,
        payload: "ok");
  }

  //App launch notification
  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;
        if (response != null) {
          String? payload = response.payload;
          log("Noitification payload: $payload");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
    showNotification();
  }

  get index => product1;
  //collecting data from fire base
  // final CollectionRefrence _items=
  // FirebaseFirestore.instance.collection('items');
  get _handleNavigationChange => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: Colors.grey,
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      key: _key,
      //Drawer Section
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/Jutta.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Jutta Junction",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text("support.juttaj@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Divider(
                thickness: 1, color: Color.fromARGB(255, 255, 255, 255)),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.person),
            //   title: const Text('My Profile',
            //       style: TextStyle(color: Colors.white)),
            //   onTap: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: const Text('My Profile'),
            //           content: const Text('Under Construction'),
            //           actions: [
            //             TextButton(
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //               child: const Text('Close'),
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.category),
            //   title:
            //       const Text('Review', style: TextStyle(color: Colors.white)),
            //   onTap: () {
            //     showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: const Text('Review'),
            //             content: const Text('Under Construction'),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: const Text('Close'),
            //               ),
            //             ],
            //           );
            //         });
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.wallet_giftcard_rounded),
            //   title:
            //       const Text('Offers', style: TextStyle(color: Colors.white)),
            //   onTap: () {
            //     showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: const Text('Offers'),
            //             content: const Text('No Offers Available'),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: const Text('OK'),
            //               ),
            //             ],
            //           );
            //         });
            //   },
            // ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQ', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.faqRoute);
              },
            ),
             
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.assignment_return_rounded),
              title: const Text('Refund & Return',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigator.pushNamed(context, MyRoutes.returnrefundRoute);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.question_answer),
              title: const Text('Review', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigator.pushNamed(context, MyRoutes.ratingRoute);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.help_outline),
              title: const Text('Help Center',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Help Center'),
                        content: const Text('No Help Center Available'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    });
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.logout_outlined),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("You pressed Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('yes'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.info_outline),
              title:
                  const Text('About Us', style: TextStyle(color: Colors.white)),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Jutta Junction',
                    applicationVersion: '1.0.0',
                    applicationIcon: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/Jutta.png'),
                    ),
                    children: [
                      const Text(
                          'Jutta Junction is a platform for all your footwear needs. We provide you with the best quality footwear at the best prices. We have a wide range of products from all the top brands. We also provide you with the best customer service. We are always here to help you out with any queries you may have. We hope you enjoy your shopping experience with us.'),
                    ]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Color.fromARGB(255, 2, 5, 8),
        color: Color.fromARGB(255, 255, 255, 255),
        //IconButtons
        items: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.NewHomePageRoute);
            },
          ),
            IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.searchRoute);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.CartPageRoute);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.profileRoute);
            },
          ),
        ],
      ),
      //Ap

      //App Bar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/juttanew.png",
              fit: BoxFit.contain,
              height: 150,
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {
              showNotification();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.qr_code_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.qrRoute);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // width: double.infinity,
        //color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(
              //     filled: true,
              //     prefixIcon: Icon(Icons.search),
              //     hintText: "The best shoes for best people.",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide.none,
              //     ),
              //   ),
              // ),
              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Top(
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Product_Detail(
                                product: product1[index],
                              ))))),
              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Brands",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildBrands("nikelogo.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      _buildBrands("adidaslogo.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      _buildBrands("convlogo.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      _buildBrands("drmartenslogo.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      _buildBrands("nikelogo.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      _buildBrands("adidaslogo.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      _buildBrands("convlogo.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      _buildBrands("drmartenslogo.png"),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),

//               ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: product2.length,
//   itemBuilder: (context, index) => Container(
//     width: 160,
//     height: 200,
//     padding: EdgeInsets.all(4),
//     decoration: BoxDecoration(
//       color: Vx.randomOpaqueColor,
//       borderRadius: BorderRadius.circular(10)
//     ),
//     child: Image.asset(product2[index].image,
//       fit: BoxFit.contain,
//       alignment: Alignment.center,
//     ),
//   ),
// ),

              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New arrivals",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Buttom(
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Product_Detail(
                                product: product2[index],
                              )))))
              // Buttom(),
            ],
          ),
        ),
      ),
    );
    // resizeToAvoidBottomInset: false,
  }
}

class Buttom extends StatelessWidget {
  final Function press;
  const Buttom({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: product2.length,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   //height of ticket paper
              //   childAspectRatio: 2.2,
              // ),
              itemBuilder: (context, index) => ItemCart(
                product: product2[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Product_Detail(
                              product: product2[index],
                            )))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  final Function press;
  const Top({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 200,
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: product1.length,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   //height of ticket paper
              //   childAspectRatio: 2.2,
              // ),
              itemBuilder: (context, index) => ItemCart(
                product: product1[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Product_Detail(
                              product: product1[index],
                            )))),
              ),
            ))
          ],
        ),
      ),
    );
    // body: StreamBuilder(
    //   stream: _items.snapshot(),
    //   builder: (context, AsyncSnapshot<QuerySnapshot>streamSnapshot) {
    //     if (streamSnapshot.hasData){
    //       return ListView.builder(
    //         itemCount: streamSnapshot.data!.dos.length,
    //         itemBuilder:((context, index) {
    //           final DocumentSnapshot documentSnapshot=streamSnapshot.data!.docs[index];
    //           return Card(
    //             child: Container(
    //               child: Row(
    //                 children: [
    //                   Text(documentSnapshot['name']),
    //                   Text(documentSnapshot['price'.toString()])
    //                 ],
    //               ),
    //              ),

    //           ),

    //         }));
    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }),
  }
}
