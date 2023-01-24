import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:getwidget/getwidget.dart';

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
        title: Text('Frequently Asked Questions'),
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new)
              .iconColor(Colors.black)
              .box
              .make(),
          onPressed: () {
            Navigator.pushNamed(context, "/HomePage");
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            children: <Widget>[
              GFAccordion(
                collapsedIcon: Icon(Icons.add),
                expandedIcon: Icon(Icons.minimize),
                title: "Has my ordern been dispatched yet?",
                content:
                    'When you place your order we will send you an email confirming that the order has been placed and the items you have ordered.\n \n When your order has been dispatched from our warehouse, we will send you a second email to confirm this.',
              ),
              GFAccordion(
                collapsedIcon: Icon(Icons.add),
                expandedIcon: Icon(Icons.minimize),
                title: "How long does the shipping take?",
                content:
                    ' It depends on your location.Usually it takes around 4-5 days.',
              ),
              GFAccordion(
                collapsedIcon: Icon(Icons.add),
                expandedIcon: Icon(Icons.minimize),
                title: "How do I change the personal details of my account?",
                content:
                    ' You can log in to your account and click on myprofile and then on settings.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
