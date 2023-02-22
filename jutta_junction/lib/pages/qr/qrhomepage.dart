import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/customs/custom_icons.dart';
import 'package:jutta_junction/pages/qr/generateqr.dart';
import 'package:jutta_junction/pages/qr/scanqr.dart';

class QrHomePage extends StatefulWidget {
  const QrHomePage({super.key});

  @override
  State<QrHomePage> createState() => _QrHomePageState();
}

class _QrHomePageState extends State<QrHomePage> {
 
@override
Widget build(BuildContext context) {
	return Scaffold(
	//Appbar having title
	appBar: AppBar(
		title: Center(child: Text("QR Code")),
	),
	
	body: Container(
		width: 500,
		height: 500,
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		crossAxisAlignment: CrossAxisAlignment.stretch,
		children: [
			//Display Image
			Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU"),height: 50,),
			
			//First Button
			ElevatedButton(
			// padding: EdgeInsets.all(15),
			onPressed: (){
				Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
			},
				child: Text("Scan QR Code",style: TextStyle(color: Color.fromARGB(255, 11, 11, 12)),),
			style: ButtonStyle(
			shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(20),
				side: BorderSide(color: Color.fromARGB(255, 19, 20, 23)),)
      ),
			),
      ),

			// SizedBox(height: 10),

			//Second Button
			ElevatedButton(
			// padding: EdgeInsets.all(15),
			onPressed: (){
				Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
															GenerateQR()));
			},
			child: Text("Generate QR Code", style: TextStyle(color: Color.fromARGB(255, 13, 13, 14)),),
      style: ButtonStyle(
			shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(20),
				side: BorderSide(color: Color.fromARGB(255, 23, 24, 27)),
			),
			),),)
		],
		),
	)
	);
}
}

