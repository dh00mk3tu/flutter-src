import 'package:chat/container/pages/inbox.dart';
import 'package:chat/container/pages/login.dart';
import 'package:chat/container/pages/settings.dart';
import 'package:chat/services/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AuthFunction auth = new AuthFunction();
  bool isLoggedIn = true; 

  void stateChange() {
    // setState(() {
      isLoggedIn = !isLoggedIn;
    // });
  }
  User loggedInUser = FirebaseAuth.instance.currentUser;
  String email = loggedInUser.email;
  String name = loggedInUser.displayName;

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            // currentAccountPicture: ,
            accountName: Text("$name"),
            accountEmail: Text("$email"),

          ),
          ListTile(
            title: Text("People"),
            onTap: (){
              Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (context) => InboxScreen()
                )
              );
            },  
          ),
          // ListTile(
          //   title: Text("People"),
          //   onTap: (){
          //     Navigator.pushReplacement(
          //       context, MaterialPageRoute(
          //         builder: (context) => InboxScreen()
          //       )
          //     );
          //   },  
          // ),
          // ListTile(title: Text("Inbox")),
          ListTile(
            title: Text("Settings"),
            onTap: (){
              Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (context) => SettingsScreen()
                )
              );
            },  
          ),
          ListTile(title: Text("About")),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              auth.LogOut();
              Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (context) => LogInScreen()
                )
              );
            },
          ),
        ],
      ),
    );
  }
}