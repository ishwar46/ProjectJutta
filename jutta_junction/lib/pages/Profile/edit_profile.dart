import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

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
            backgroundColor: Colors.purple,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new)
                  .iconColor(Color.fromARGB(255, 255, 255, 255))
                  .box
                  .make(),
              onPressed: () {
                Navigator.pushNamed(context, "/NewHomePage");
              },
            ),
            centerTitle: true,
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
