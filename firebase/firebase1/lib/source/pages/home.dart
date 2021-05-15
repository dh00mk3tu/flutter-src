import 'package:firebase1/source/pages/drawer.dart';
import 'package:firebase1/source/pages/imageupload.dart';
// import 'package:firebase1/source/pages/login.dart';
import 'package:firebase1/source/pages/loginState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  
  final auth = FirebaseAuth.instance;
  String _ok = "ok";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home!"),
      ),
      drawer: Drawer(
        child:MainDrawer(),
      ),
      body: Container(
        child: Column(
          children: [
            loginSuccess(_ok),
            SetImage()
          ],
        ) 
      ),
    );
  }
}