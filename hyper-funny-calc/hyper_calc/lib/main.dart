import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hyper Mega Calc",
      theme: new ThemeData(
        primarySwatch: Colors.green
      ),
      home: new HomePage(),
    );
  } 
}