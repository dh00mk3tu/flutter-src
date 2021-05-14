import 'package:firebase1/source/pages/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FIrebase Login",
      theme: ThemeData(
        accentColor: Colors.pink,
        primarySwatch: Colors.purple
      ),
      home: LoginScreen(),   
    );
  }
}