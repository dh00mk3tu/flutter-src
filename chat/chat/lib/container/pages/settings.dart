import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:flutter/material.dart';

bool changeTheme = false; 

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text("Change Your Settings",
                  style: TextStyle(
                    fontSize: 25
                  ),
                )
              ),
            ),
            SizedBox(
              height: 20
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Theme",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: changeTheme,
                      onChanged: (newChange) {
                        setState(() {
                          changeTheme = newChange;
                        });
                      }
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Change Photo",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ]
                ),
              ),
            ),
            // FloatingActionButton(
            //   child: Icon(Icons.home),
            // ),
          ]
        ),
      ),
    );
  }
}

// WIDGET