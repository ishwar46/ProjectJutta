import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/catelog.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'https://images.unsplash.com/photo-1612825173281-9a193378527e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80',
    'https://images.unsplash.com/photo-1580654712603-eb43273aff33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1627916607164-7b20241db935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    'https://images.unsplash.com/photo-1522037576655-7a93ce0f4d10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1570829053985-56e661df1ca2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];
  Widget _buildFeatureProduct(
      {required String name, required double price, required String image}) {
    return Card(
      child: Container(
        height: 200,
        width: 150,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$image"),
                ),
              ),
            ),
            Text(
              "Rs. $price",
              style: TextStyle(
                  color: Color(0xff9b96d6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            // IconButton(
            //   icon: Icon(Icons.check),
            //   onPressed: (() {}),
            // ),
          ],
        ),
      ),
    );
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

  Widget _buildNewArrivals(
      {required String name, required double price, required String image}) {
    return Card(
      child: Container(
        height: 200,
        width: 150,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$image"),
                ),
              ),
            ),
            Text(
              "Rs. $price",
              style: TextStyle(
                  color: Color(0xff9b96d6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            // IconButton(
            //   icon: Icon(Icons.check),
            //   onPressed: (() {}),
            // ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
            const Divider(
                thickness: .06, color: Color.fromARGB(255, 30, 29, 29)),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.person),
              title: const Text('My Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add Navigation logic here
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.category),
              title:
                  const Text('Brands', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add Navigation logic here
              },
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.wallet_giftcard_rounded),
              title:
                  const Text('Offers', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add Navigation logic here
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Color.fromARGB(255, 2, 5, 8),
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.chat),
          Icon(Icons.shopping_cart),
          Icon(
            Icons.account_box,
            size: 30,
          ),
        ],
        onTap: (index) {
          //Handle button ta
        },
      ),
      //App Bar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/juttanew.png",
              fit: BoxFit.contain,
              height: 120,
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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.qr_code_sharp,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: double.infinity,
                    //color: Colors.purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "The best shoes for best people.",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Featured",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                _buildFeatureProduct(
                                    image: "nike.png",
                                    price: 9000,
                                    name: "Nike Blazers Mid '77"),
                                _buildFeatureProduct(
                                    image: "jordan.jpg",
                                    price: 9000,
                                    name: "Jordan University Blue"),
                                _buildFeatureProduct(
                                    image: "converse.png",
                                    price: 9000,
                                    name: "Converse High"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    //color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Brands",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildBrands("nikelogo.png"),
                          SizedBox(
                            width: 5,
                          ),
                          _buildBrands("adidaslogo.png"),
                          SizedBox(
                            width: 20,
                          ),
                          _buildBrands("convlogo.png"),
                          SizedBox(
                            width: 10,
                          ),
                          _buildBrands("drmartenslogo.png"),
                          SizedBox(
                            width: 5,
                          ),
                          _buildBrands("nikelogo.png"),
                          SizedBox(
                            width: 5,
                          ),
                          _buildBrands("adidaslogo.png"),
                          SizedBox(
                            width: 20,
                          ),
                          _buildBrands("convlogo.png"),
                          SizedBox(
                            width: 10,
                          ),
                          _buildBrands("drmartenslogo.png"),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  SizedBox(
                    height: 20,
                  ), ////
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                _buildNewArrivals(
                                    image: "nb550.png",
                                    price: 9000,
                                    name: "New Balance 550"),
                                _buildNewArrivals(
                                    image: "vegan_black.png",
                                    price: 9000,
                                    name: "DR Martens Vegan Black"),
                                _buildNewArrivals(
                                    image: "stan.png",
                                    price: 9000,
                                    name: "Stan Smith"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//       backgroundColor: Color.fromARGB(255, 249, 249, 249),
//       //Hamburger Drawer
//       drawer: Drawer(),
//       //Hamburger Drawer
//       appBar: AppBar(
//         title: const Text("Jutta Junction",
//             style: TextStyle(color: Colors.white, fontSize: 17)),
//         actions: [
//           CircleAvatar(
//             radius: 12,
//             backgroundColor: Color(0xffd4d181),
//             child: Icon(
//               Icons.search,
//               size: 17,
//               color: Colors.black,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: CircleAvatar(
//               radius: 12,
//               backgroundColor: Color(0xffd4d181),
//               child: Icon(
//                 Icons.shop,
//                 size: 17,
//                 color: Colors.black,
//               ),
//             ),
//           )
//         ],
//         backgroundColor: Color.fromARGB(255, 86, 88, 196),
//         elevation: 0.0,
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Color.fromARGB(255, 2, 5, 8),
//         items: <Widget>[
//           Icon(Icons.home),
//           Icon(Icons.chat),
//           Icon(Icons.shopping_cart),
//           Icon(
//             Icons.account_box,
//             size: 30,
//           ),
//         ],
//         onTap: (index) {
//           //Handle button ta
//         },
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               CarouselSlider.builder(
//                   carouselController: controller,
//                   itemCount: urlImages.length,
//                   itemBuilder: (context, index, realIndex) {
//                     final urlImage = urlImages[index];
//                     return buildImage(urlImage, index);
//                   },
//                   options: CarouselOptions(
//                     height: 200,
//                     autoPlay: true,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration: Duration(seconds: 2),
//                     enlargeCenterPage: true,
//                     // onPageChanged: (index, reason) =>
//                     //     setState(() => activeIndex = index),
//                   )),
//               SizedBox(height: 12),
//               buildIndicator(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         onDotClicked: animateToSlide,
//         effect: SlideEffect(
//           spacing: 2,
//           radius: 4.0,
//           paintStyle: PaintingStyle.fill,
//         ),
//         activeIndex: activeIndex,
//         count: urlImages.length,
//       );

//   void animateToSlide(int index) => controller.animateToPage(index);
// }

// Widget buildImage(String urlImage, int index) =>
//     Container(child: Image.network(urlImage, fit: BoxFit.cover));
