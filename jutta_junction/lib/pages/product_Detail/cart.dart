import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),

        
      ),
      body: Column(children: [
        Placeholder().p32().expand(),Divider(),
        _CartTotal(),
        _CartList(),

      ]),

    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          "\$9000".text.xl5.make(),
          30.widthBox,
          ElevatedButton(onPressed: (() {
            
          // ignore: deprecated_member_use
          }), child: "buy".text.color(Colors.white).make())
        ],
      ),

    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}