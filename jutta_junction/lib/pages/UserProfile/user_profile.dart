import 'package:flutter/material.dart';
import 'package:jutta_junction/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:jutta_junction/pages/UserProfile/imagestring.dart';
import 'package:jutta_junction/pages/UserProfile/textstring.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: Colors.black,
        ),
        title: Text(
          tProfile,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage(tProfileImage),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.lightBlue.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.user_check,
                    size: 18.0,
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  "My orders",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.angle_right,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.money_bill,
                    size: 18.0,
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  "My requests",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.angle_right,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.alternate_sign_out,
                    size: 18.0,
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    LineAwesomeIcons.angle_right,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// class ProfileMenuWidget extends StatelessWidget {
//   const ProfileMenuWidget({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.endIcon=true,
//     this
//   }) : super(key: key);
//
//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? textColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         width: 30, height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color:Colors.blueAccent.withOpacity(0.1),
//         ),
//         child: const Icon(LineAwesomeIcons.user_check,size:18.0,color: Colors.blue,),
//       ),
//       title: Text("User Details",
//       style: TextStyle(
//
//       ),),
//       trailing: Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color:Colors.grey.withOpacity(0.1),
//         ),
//         child: const Icon(LineAwesomeIcons.angle_right,size:18.0,color: Colors.grey,),
//       ),
//     );
//   }
// }


// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'dart:ui';

// class UserProfile extends StatelessWidget {
//   //const UserProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff8f8f8),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // actions: [
//         //  NotificationButton(),
//         // ],
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               height: 130,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   CircleAvatar(
//                     maxRadius: 65,
//                     backgroundImage: AssetImage("images/profile.jpg"),
//                   ),
//                 ],
//               ),
