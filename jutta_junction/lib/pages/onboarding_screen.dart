import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:jutta_junction/pages/login_page.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: "Shop Now",
        body: "Start your Journey with Nike",
        footer: ElevatedButton(onPressed: () {}, child: const Text("Lets go")),
        image: Center(
          child: Image.asset("assets/images/nike.png"),
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
    PageViewModel(
        title: "Purchase",
        body: "Where ever you are . Be all Converse",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Lets go"),
        ),
        image: Center(
          child: Image.asset("assets/images/a.png"),
          heightFactor: 200,
          widthFactor: 100,
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
    PageViewModel(
        title: "Air Jordan Sneakers ",
        body:
            "Take Flight.Shop the latest Air Jordan Sneakers, including the Air Jordan 1 Retro High OG 'Chicago Lost & Found' and more at JuttaJunction",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("Lets go"),
        ),
        image: Center(
          child: Image.asset("assets/images/jordan.png"),
        ),
        decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Color.fromARGB(255, 229, 139, 245),
            activeSize: Size.square(15),
          ),
          showDoneButton: true,
          done: const Text(
            'done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: (() => onDone(context)),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
