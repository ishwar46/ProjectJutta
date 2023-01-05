import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jutta_junction/customs/custom_icons.dart';



class Payment extends StatefulWidget {
  const Payment ({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}
class  _PaymentState extends State<Payment> {
  String? payment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6EA),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 130,
                    width: 20,
                  ),
                  CustomIcon(
                    icon: Icons.arrow_back,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 130,
                    width: 30,
                  ),
                  Container(
                    child: const Text("Payment Methods",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Total Amount',
                            style: TextStyle(color: Color.fromRGBO(
                                21, 34, 56, 1.0), fontSize: 17),
                          ),
                        )
                      ],
                    ),



                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(157, 200, 224, 1.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        obscureText: false,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            // label: Text("Password"),
                            hintText: "Enter Amount to Pay",
                            prefixIcon: Icon(Icons.payment)),
                      ),
                    ),
                  ],
                ),
              ),
              RadioListTile(
                title: const Text("Esewa",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                ),
                value: "Esewa",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Khalti",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: "Khalti",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              ),
              Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => LoginScreen(),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(133, 153, 189, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),

                  child: const Text("Pay Now",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 17,
                        fontWeight: FontWeight.bold

                      ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      )
    );
  }
}