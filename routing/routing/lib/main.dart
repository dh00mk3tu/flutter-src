import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple 
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nice UI"
        ),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 10.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("dh00mk3tu"),
              accountEmail: Text("dotdh00mk3tu@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink[700],
                child: Text(
                  "DK3TM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ), 
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text(
                    "!DK3TM",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ), 
                )
              ],
            ),
            ListTile(
              title: Text("Page 1"),
              trailing: Icon(Icons.accessibility_new),
            ),
            ListTile(
              title: Text("Page 2"),
              trailing: Icon(Icons.wrong_location),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            ),            
          ],
        ),
      ),
      body : Container(
        child: Center(
          child: Text("Home Page")
        )
      ),
    );
  }
}