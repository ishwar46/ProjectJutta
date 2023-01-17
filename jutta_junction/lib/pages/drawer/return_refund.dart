// import 'package:bottom_picker/bottom_picker.dart';
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
                "Return & Refund.\n If the items you bought from JuttaJuntion didn’t meet your expectations, then you can return them for either a refund or exchange. \n \n 1. If you paid with credit/debit card or gift card, you may return your item to a store for a refund or exchange. To find a store near you, please click here. . \n \n 2.Please keep your return tracking number and order number for reference should you need to contact us about your return or exchange.\n 1.If you believe your item is defective, it must be returned within 45 days.\n 2.If the item is deemed defective, we will process a return in accordance with our return policy. \n 3.If the item is deemed to be not defective, it will be returned to you.\n 4.We don't accept COD returns.\n 5.If you request express or overnight shipping for your exchange, then you'll cover the full shipping cost.\n 6.We'll send your exchanged items to only one address.  ",
                
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
