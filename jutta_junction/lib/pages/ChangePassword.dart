import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customs/custom_icons.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ConfirmPAsswordWidgetState();
}


class _ConfirmPAsswordWidgetState extends State<ChangePassword> {
  final GlobalKey<FormState> _passKey=GlobalKey();
  final GlobalKey<FormState> _confirmPassKey=GlobalKey();


  TextEditingController password=new TextEditingController();
  TextEditingController confirmPassword=new TextEditingController();
  bool showPassword=false;
  var confirmPass;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color.fromRGBO(133, 143 ,177 , 21),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(133, 143 ,177 , 21),
          elevation:0,

          //   children: [

          leading: Center(

            child: Container(
              child: CustomIcon(
                icon:Icons.arrow_back,
                onPressed:(){
                  Navigator.of(context).pop();
                },
              ),
            ),

          ),
        ),
    );
  }

 
}