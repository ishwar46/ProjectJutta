import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          color: Colors.black,
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

        backgroundColor: Color(0xffd6b738),
      

      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage
              (fit: BoxFit.cover,
                image: NetworkImage(
                _imageUrl),

              ),
                
              
              
              
              color: Colors.red,
            borderRadius:BorderRadius.circular(10),
            )
            ,child: Row(
              children: [
                Expanded(
                  child:Container(color: Colors.yellow,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120,bottom: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30)
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                  )),

                  Expanded(
                  child:Container(color: Colors.red ,))
              ],
            ),
          )
        ]),
      ),
    );
  }
}