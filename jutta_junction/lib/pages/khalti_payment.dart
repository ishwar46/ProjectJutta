import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class KhaltiPay extends StatefulWidget {
  const KhaltiPay({super.key});

  @override
  State<KhaltiPay> createState() => _KhaltiPayState();
}

class _KhaltiPayState extends State<KhaltiPay> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Pay with Khalti",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 92, 15, 163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //Image for Khalti
              InkWell(
                splashColor: Colors.purple,
                onTap: () {
                  print("Image Tapped");
                  khaltiWallet();
                }, // Image tapped
                child: Image.asset(
                  'assets/images/khaltilogo.png',
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  khaltiWallet() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000,
          productIdentity: "1",
          productName: "nike blazers mid 77"),
      preferences: [PaymentPreference.khalti],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCanceled,
    );
  }

  // mentod to handle success
  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Payment successful"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  // method to handle failure
  void onFailure(PaymentFailureModel failure) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Failure"),
            content: Text("Payment failed"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  // method to handle onCanceled

  void onCanceled() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Canceled"),
            content: Text("Payment canceled"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}
