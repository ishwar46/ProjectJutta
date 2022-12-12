import 'package:flutter/material.dart';
import 'package:jutta_junction/customs/custom_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Text("Verify OTP",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            // SizedBox(height:15),

            Text(
              "Please enter 5 digit OTP code",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30),
            PinCodeTextField(
              length: 5,
              obscureText: false,
              appContext: context,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 58,
                fieldWidth: 58,
                activeFillColor: Colors.white,
                activeColor: Colors.red,
                inactiveColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedColor: Colors.red,
                selectedFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
