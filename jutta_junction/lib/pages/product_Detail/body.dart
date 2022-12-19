import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size as Size;

    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Nike",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
              ),
            )
          ],
          
          
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.4),
          height: size.height * 0.45,

          decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 162, 162),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
          // child: new Image.asset('assets/images/Jutta.png'),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
