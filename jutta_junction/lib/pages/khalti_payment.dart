import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

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
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: const Text('Pay with Khalti'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image for Khalti
            GestureDetector(
              onTap: () {
                paywithKhaltiApp();
              }, // Image tapped
              child: Image.asset(
                'assets/images/khaltilogo.png',
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  paywithKhaltiApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000, productIdentity: "Pd id", productName: "productName"),
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
