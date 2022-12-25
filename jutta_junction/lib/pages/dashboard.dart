import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  static const String _imageUrl =
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/B9FF/production/_117751674_satan-shoes1.jpg';
  Widget singleProducta() {
    return Container(
        height: 230,
        width: 160,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 239, 239),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Image.network(
                    'https://media.restocks.net/products/CT8532-104/air-jordan-3-retro-unc-2020-2-1000.png')),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Air Jordan 3 Retro UNC',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('670 USD',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ],
              ),
            ))
          ],
        ));
  }

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'https://images.unsplash.com/photo-1612825173281-9a193378527e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80',
    'https://images.unsplash.com/photo-1580654712603-eb43273aff33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1627916607164-7b20241db935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    'https://images.unsplash.com/photo-1522037576655-7a93ce0f4d10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1570829053985-56e661df1ca2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
      drawer: Drawer(),
      appBar: AppBar(
        title:
            Text("Home", style: TextStyle(color: Colors.white, fontSize: 17)),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 23, 21, 16),
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(_imageUrl)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 140, bottom: 10),
                          child: Container(
                            height: 40,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            //Image Slider Start Second
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                // onPageChanged: (index, reason) =>
                //     setState(() => activeIndex = index),
              ),
            ),

            SizedBox(height: 12),
            buildIndicator(),
            //Image Slider Start Second
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('The 2023 Collection: Chapter 01'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProducta(),
                  singleProducta(),
                  singleProducta(),
                  singleProducta(),
                  singleProducta(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Container(child: Image.network(urlImage, fit: BoxFit.cover));
