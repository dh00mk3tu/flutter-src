import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/source/pages/login.dart';
import 'package:firebase1/source/pages/showData.dart';
import 'package:firebase1/source/pages/updateDetails.dart';
import 'package:firebase1/source/services/firedata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase1/source/pages/imageupload.dart';


// ignore: must_be_immutable
class MainDrawer extends StatelessWidget {
  var flag = 0;
  Future<void> _logOut() async{
    await FirebaseAuth.instance.signOut();
    flag = 1;
    CircularProgressIndicator();
  }

  // fetchData() async {
  //   dynamic test = await getUserDetails();
  //   print(test['name']);
  // }
  fetchName() {
    return Text("amni");
  }
  
  // DocumentSnapshot tempDat = snapshot.data.documents[index];
  @override
  Widget build(BuildContext context) {
return Drawer(
      child: Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 50.0,
          //   padding: EdgeInsets.all(10),
          //   color: Colors.red[200]
          // ),
          UserAccountsDrawerHeader(
            accountName: fetchName(),
            accountEmail: Text("email"),
            currentAccountPicture: CircleAvatar(
              child: drawerImage()
            ),
          ),
          ListTile(
            trailing: Icon(Icons.person),
            title: Text(
              "View Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DisplayScreen()
                ),
              );
            },  
          ),

          ListTile(
            trailing: Icon(Icons.book),
            title: Text(
              "Update Data",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UpdateScreen()
                ),
              );
            }, 
          ),
          Divider(

          ),
          ListTile(
            trailing: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              _logOut();
              if(flag == 1) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen()
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds:1),
                    content: Text("Success!"),
                  )
                );
              }
              else {
                String _err = "Failed!";
                print("no logout for me");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds:1),
                    content: Text("$_err"),
                  )
                );
              }        
            }
          )
        ],
      )
    );
  }
}

