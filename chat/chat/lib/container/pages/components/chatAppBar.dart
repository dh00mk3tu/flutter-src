import 'package:flutter/material.dart';


Widget chatAppbar(BuildContext context, String contact) {
  return AppBar(
    centerTitle: true,
    title: Row(
      children: [
        CircleAvatar(),
        SizedBox(
          width: 10,
        ),
        Text("$contact"),
      ],
    ),
    backgroundColor: Colors.teal,
    
  );
}