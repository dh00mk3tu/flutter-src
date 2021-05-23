import 'package:chat/container/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'not whatsapp',
      theme: ThemeData.dark(),
      home: LogIn(),
    );
  }
}