import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/qr/generateqr.dart';
import 'package:jutta_junction/pages/qr/scanqr.dart';

class qrhomepage extends StatefulWidget {
  const qrhomepage({super.key});

  @override
  State<qrhomepage> createState() => _qrhomepageState();
}

class _qrhomepageState extends State<qrhomepage> {
 
@override
Widget build(BuildContext context) {
	return Scaffold(
	
	body: Container(
		width: 500,
		height: 500,
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		crossAxisAlignment: CrossAxisAlignment.stretch,
		children: [
			//Display Image
			Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU")),
			
			//First Button
			ElevatedButton(
			// padding: EdgeInsets.all(15),
			onPressed: (){
				Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
			},
				child: Text("Scan QR Code",style: TextStyle(color: Colors.indigo[900]),),
			style: ButtonStyle(
			shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(20),
				side: BorderSide(color: Colors.indigo),)
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
			child: Text("Generate QR Code", style: TextStyle(color: Colors.indigo[900]),),
      style: ButtonStyle(
			shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(20),
				side: BorderSide(color: Colors.indigo),
			),
			),),)
		],
		),
	)
	);
}
}

