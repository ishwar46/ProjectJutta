// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:jutta_junction/pages/profilesettings.dart';

// class SettingsUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Setting UI",
//       home: EditProfilePage(),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.green,
//           ),
//           onPressed: () {
//             Navigator.pushNamed(context, "/HomePage");
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               color: Colors.green,
//             ),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => SettingPage()));
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Text(
//                 "User Profile",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                   "https://www.google.com/search?q=random+images&oq=random+images&aqs=chrome..69i57j0i512l9.2874j0j7&sourceid=chrome&ie=UTF-8#imgrc=hbXVK53csZJ90M"))),
//                     ),
//                     Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                             color: Colors.green,
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 35,
//               ),
//               buildTextFiled("Full Name", "your name", false),
//               buildTextFiled("E- mail", "example@gmail.com", false),
//               buildTextFiled("Password", "*********", true),
//               buildTextFiled("Location", "Ktm, Townplanning", false),
//               SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                     ),
//                     onPressed: () {},
//                     child: Text("Cancel",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       color:
//                       Colors.green;
//                       Padding:
//                       EdgeInsets.symmetric(horizontal: 50);
//                       elevation:
//                       2;
//                       shape:
//                       RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20));
//                     },
//                     child: Text(
//                       "SAVE",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextFiled(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 35.0),
//       child: TextField(
//         obscureText: isPasswordTextField ? showPassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.grey,
//                     ),
//                   )
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 3),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             )),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
    super.initState();
  }

  File? _image;
  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Widget UserName(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.fullName.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userEmail(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.email.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userPhone(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.phone.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userUsername(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.username.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userPassword(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.password.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, authVM, chid) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            centerTitle: true,
            title: Text("Profile Information"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "https://imgs.search.brave.com/VfOlmssamn3NTAP14DFpqr1z9pxdR7P4czo10TKxRuk/rs:fit:860:681:1/g:ce/aHR0cHM6Ly93d3cu/cG5naXRlbS5jb20v/cGltZ3MvbS8xNDYt/MTQ2ODQ3OV9teS1w/cm9maWxlLWljb24t/YmxhbmstcHJvZmls/ZS1waWN0dXJlLWNp/cmNsZS1oZC5wbmc",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 125,
                        left: 100,
                        width: 90,
                        height: 30,
                        child: ActionChip(
                          label: Text("Change"),
                          onPressed: () => getImage(ImageSource.gallery),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text("Full name"),
                        subtitle: UserName(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text("Email"),
                        subtitle: userEmail(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock_open),
                        title: Text("Password"),
                        subtitle: userPassword(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_android),
                        title: Text("Phone"),
                        subtitle: userPhone(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.portrait),
                        title: Text("Username"),
                        subtitle: userUsername(authVM),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}
