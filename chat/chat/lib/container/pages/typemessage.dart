import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/drawer.dart';

class TypeMessageScreen extends StatefulWidget {
  @override
  _TypeMessageScreenState createState() => _TypeMessageScreenState();
}

class _TypeMessageScreenState extends State<TypeMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            SizedBox(child: TextField()),
            Icon(Icons.send)
          ]
        ),
      )
    );
  }
}