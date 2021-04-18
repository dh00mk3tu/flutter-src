import 'package:flutter/material.dart';
import 'package:chit_chat/HomePage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 

  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Chit Chat",
      home : new HomePage(),
    );
  }
}