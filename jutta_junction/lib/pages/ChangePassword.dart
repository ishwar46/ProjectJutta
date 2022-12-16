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
        body:Container(
          padding: EdgeInsets.symmetric(
            horizontal:25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:343,
                //  height:41,
                padding:EdgeInsets.only(top:50,bottom:20),
                child: Text(
                    "Change Password",
                    style:TextStyle(
                      fontSize:32,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height:10),
              Container(
                  height:70,

                  child:Form(
                    key: _passKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller:password,
                          obscureText: !showPassword,
                          validator:(val){
                            confirmPass=val;
                            if(val==null || val.isEmpty){
                              return "Password cannot be empty";
                            }else if (val.length<6){
                              return "Password must be at least 6 characters";
                            }else{
                              return null;
                            }

                          },
                          decoration: InputDecoration(
                            // border:InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),

                            hintText:"New Password",
                            suffixIcon: showPassword?
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child:Icon(Icons.panorama_fish_eye)
                            )
                                :
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child:Icon(Icons.remove_red_eye)
                            ),
                            filled:true,
                            fillColor: Colors.white,

                            contentPadding: EdgeInsets.symmetric(
                              horizontal:20,
                              vertical:13,
                            ),

                          ),
                        ),
                      ],
                    ),
                  )

              ),
              SizedBox(height:10),
Container(
    height:70,
    child:Form(
      key:_confirmPassKey,
      child: Column(

        children: [
          TextFormField(
            controller:confirmPassword,
            obscureText: !showPassword,
            validator:(val){
              if(val==null || val.isEmpty){
                return "Confirm password cannot be empty";
              }else if(val.length<6){
                return "Confirm password must be at least 6 characters";
              }else if(val!=confirmPass){
                return "Password doesn't match";
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText:"Confirm Password",

              suffixIcon: showPassword?
              InkWell(
                  onTap: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child:Icon(Icons.panorama_fish_eye)
              )
                  :
              InkWell(
                  onTap: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child:Icon(Icons.remove_red_eye)
              ),
              filled:true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal:20,
                vertical:13,
              ),

            ),
          ),
        ],
      ),
    )

),
SizedBox(height:30),
CustomButton(
    title: "Confirm",
    onPressed: (){
      if (_passKey.currentState!.validate() && _confirmPassKey.currentState!.validate()) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Otp())
        );
      }
    },
),

              
            ]
          ),
        )
    );
  }


 
}