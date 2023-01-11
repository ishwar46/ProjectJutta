import 'package:jutta_junction/pages/test/qr_page.dart';
// import 'package:searchbar_animation/searchbar_animation.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox(
      height: 50.0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (AppBar(
        title: Text("Jutta Junction"),
        backgroundColor: Color.fromARGB(255, 109, 146, 189),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRCode()),
              );
            },
          ),
        ],
        elevation: 0.0,
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Good Morning, User!'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 109, 146, 189),
                //User Image
                image: DecorationImage(
                  image: AssetImage('assets/images/usernew.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Adidas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   index: 0,
      //   height: 50.0,
      //   color: Colors.white,
      //   backgroundColor: Colors.white,
      //   buttonBackgroundColor: Colors.green,
      //   animationCurve: Curves.easeInOut,
      //   items: <Widget>[
      //     Icon(
      //       Icons.home,
      //     ),
      //     Icon(Icons.chat),
      //     Icon(Icons.shopping_cart),
      //     Icon(
      //       Icons.account_box,
      //       size: 30,
      //     ),
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //   },
      // ),
      body: VxSwiper.builder(
        itemCount: 10,
        height: 200,
        aspectRatio: 4 / 5,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        isFastScrollingEnabled: false,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return "Item $index"
              .text
              .white
              .make()
              .box
              .rounded
              .alignCenter
              .color(Vx.randomOpaqueColor)
              .make()
              .p4();
        },
      ),
    );
  }
}
