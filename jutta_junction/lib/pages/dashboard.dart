import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  static const String _imageUrl ='https://ichef.bbci.co.uk/news/976/cpsprodpb/B9FF/production/_117751674_satan-shoes1.jpg';

 Widget singleProducta(){
    return  Container(
                  height: 230,
                  width: 160,
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 239, 239),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child:Image.network('https://media.restocks.net/products/CT8532-104/air-jordan-3-retro-unc-2020-2-1000.png')),

                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Air Jordan 3 Retro UNC',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text('670 USD',
                        style: TextStyle(
                          color: Colors.black,)),

                         

                           
          


                        
                        ],),
                      ))
                  ],
                ));

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        
        title:Text("Home",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17)),
        
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor:Color(0xffd4d181) ,
            child: Icon(Icons.search,size: 17,color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181)
              ,
                          child: Icon(Icons.shop,size: 17,color: Colors.black,),
            ),
          )
        ],  

        backgroundColor: Color.fromARGB(255, 21, 20, 18),
      

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
                  fit: BoxFit.cover,
                  image: NetworkImage(_imageUrl)
                ),
                color: Colors.white,
              borderRadius:BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:Container(
                     
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 140,bottom: 10),
                          child: Container(
                            height: 40,
                            width: 50,
                            ),
                        )
                     ,],
                    ),
                    )
                    ),
 ],
              ),
            ),
            
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Column(children: [VxSwiper.builder(

              itemCount: 10,

              height: 200,

              aspectRatio: 16 / 9,

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

              ]),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('The 2023 Collection: Chapter 01'),
                Text('View all', style:TextStyle(color: Colors.white) ,)

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
}



      
     