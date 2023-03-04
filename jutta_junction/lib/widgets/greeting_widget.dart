import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting = "";
    if (hour >= 0 && hour < 12) {
      greeting = "Good Morning!";
    } else if (hour >= 12 && hour < 18) {
      greeting = "Good Afternoon!";
    } else {
      greeting = "Good Evening!";
    }

    return Text(
      greeting,
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }
}
