import 'package:flutter/material.dart';

class QRCode extends StatelessWidget {
  const QRCode({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with the QrImage widget
    // of the package
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan & Pay')
      ,
      ),
      body: Center(
        child: Container(
          width: width,
          height: height,
          color: Colors.red,
        ),
      ),
    );
  }
}
