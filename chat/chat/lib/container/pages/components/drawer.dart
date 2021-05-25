import 'package:chat/container/pages/inbox.dart';
import 'package:chat/container/pages/login.dart';
import 'package:chat/container/pages/settings.dart';
import 'package:chat/services/authenticate.dart';
import 'package:flutter/material.dart';

AuthFunction auth = new AuthFunction();
  bool isLoggedIn = true; 

  void stateChange() {
    // setState(() {
      isLoggedIn = !isLoggedIn;
    // });
  }

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("data"),
            accountEmail: Text("data"),

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