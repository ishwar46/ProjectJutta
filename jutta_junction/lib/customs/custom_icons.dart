import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomButton({
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 41,
        // width:300,
        // margin:EdgeInsets.only(left:33,right:33),
        // padding: EdgeInsets.only(top: 20,bottom:20),
        decoration: BoxDecoration(
            color: Color(0xFF495867),
            // color:Color.fromARGB(73, 88, 104,1),

            borderRadius: BorderRadius.vertical(
                top: Radius.circular(30), bottom: Radius.circular(30))),
        child: Center(
          child: SizedBox(
            width: 290,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomIcon({
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
