import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hyper Mega Calc"),
      ),
      body: Container (
        child: Center (
         child: Column(

         ),
        )
      ),
    );
  }
}