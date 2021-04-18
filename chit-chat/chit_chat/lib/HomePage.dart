import 'package:flutter/material.dart';
import 'package:chit_chat/ChatScreen.dart';

class HomePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      
      ),
      body : ChatScreen(

      ),
    );
  }
}