import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class FaqPage extends StatefulWidget {
  FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new)
              .iconColor(Colors.black)
              .box
              .make(),
          onPressed: () {
            Navigator.pushNamed(context, "/homepage");
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            children: [
              const Text(

                "FREQUENTLY ASKED QUESTIONS \n \n *Are there any physical store? \n No, We are only based online. \n \n *Are the products geneuine? \n Yes,all the products are geneuine. \n \n *How long does the shipping take? \n It depends on your location.Usually it takes around 4-5 days.",

                
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                
                  fontWeight: FontWeight.bold
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
