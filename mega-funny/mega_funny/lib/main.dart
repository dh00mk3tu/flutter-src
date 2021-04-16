import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: "mega funny app",
    home: HomePage(),
  ));
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ghassi app"),
      ),
      body: Container(
        child: Center(child: Text("chalta bhi nahi ye app")),
      ),
    );
  }
}