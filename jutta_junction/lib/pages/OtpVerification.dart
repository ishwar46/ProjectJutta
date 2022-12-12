import 'package:flutter/material.dart';
import 'package:jutta_junction/customs/custom_icon.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(133, 143, 177, 21),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(133, 143, 177, 21),
        elevation: 0,
        //   children: [
        leading: Center(
          child: Container(
            child: CustomIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
