import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class RedturnRefund extends StatefulWidget {
  const RedturnRefund({super.key});

  @override
  State<RedturnRefund> createState() => _RedturnRefundState();
}

class _RedturnRefundState extends State<RedturnRefund> {
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
                "Return & Refund",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
