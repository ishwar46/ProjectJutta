import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class ScanQR extends StatefulWidget {
@override
_ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

String qrCodeResult = "Not Yet Scanned";

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Text("Scan QR Code"),
	),
	body: Container(
		padding: EdgeInsets.all(20),
	child: Column(
	mainAxisAlignment: MainAxisAlignment.center,
	crossAxisAlignment: CrossAxisAlignment.stretch,
	children: [
	//Message displayed over here
	Text(
		"Result",
		style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
		textAlign: TextAlign.center,
	),
	Text(
		qrCodeResult,
		style: TextStyle(
		fontSize: 20.0,
		),
		textAlign: TextAlign.center,
	),
	SizedBox(
		height: 20.0,
	),

	//Button to scan QR code
	ElevatedButton(
		// padding: EdgeInsets.all(15),
		onPressed: () async {
		String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666"
                                                    , 
                                                    "cancel", 
                                                    false, 
                                                    ScanMode.DEFAULT); //barcode scanner
		setState(() {
			qrCodeResult = barcodeScanRes;
		});
		},
		child: Text("Open Scanner",style: TextStyle(color: Color.fromARGB(255, 15, 15, 19)),),
    style: ButtonStyle(
		//Button having rounded rectangle border
		shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
		side: BorderSide(color: Colors.black12),
		borderRadius: BorderRadius.circular(20.0),
		),)
	),
  )
		],
		),
	),
	);
}
}
