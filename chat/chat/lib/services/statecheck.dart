import 'package:chat/container/pages/login.dart';
import 'package:chat/container/pages/register.dart';
import 'package:flutter/material.dart';

class StateCheck extends StatefulWidget {
  @override
  _StateCheckState createState() => _StateCheckState();
}

class _StateCheckState extends State<StateCheck> {
  
  bool isLoggedIn = true; 

  void stateChange() {
    setState(() {
      isLoggedIn = !isLoggedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLoggedIn){
      return LogInScreen();
    }
    else {
      return RegisterScreen();
    }
  }
}