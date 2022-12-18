import 'package:flutter/material.dart';
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size as Size;

    return Column(
      children: <Widget>[
        Container(
          height:size.height*0.3,
          color: Colors.black,

          
          child: new Image.asset('assets/images/Jutta.png'),
          alignment: Alignment.center,
        )
      ],
    );
  }
}