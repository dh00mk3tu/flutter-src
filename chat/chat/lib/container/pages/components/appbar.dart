import 'package:flutter/material.dart';


Widget MainAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Row(
      children: [
        // CircleAvatar(),
        // SizedBox(
        //   width: 10,
        // ),
        Text("WhatsApp Try 3"),
      ],
    ),
    backgroundColor: Colors.teal,
    
  );
}