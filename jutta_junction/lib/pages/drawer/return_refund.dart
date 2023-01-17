// import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:getwidget/getwidget.dart';


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
        title: Text("Return and Refund "),
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
                title: "What are the policies?",
                content: 'If the items you bought from JuttaJuntion didn’t meet your expectations, then you can return them for either a refund or exchange. \n \n 1. If you paid with credit/debit card or gift card, you may return your item to a store for a refund or exchange. To find a store near you, please click here. . \n \n 2.Please keep your return tracking number and order number for reference should you need to contact us about your return or exchange.\n \n 3.If you believe your item is defective, it must be returned within 45 days.\n \n 4.If the item is deemed defective, we will process a return in accordance with our return policy. \n \n 5.If the item is deemed to be not defective, it will be returned to you.\n \n 6.We dont accept COD returns.\n \n 7.If you request express or overnight shipping for your exchange, then you will cover the full shipping cost.\n \n 8.We will send your exchanged items to only one address.',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
