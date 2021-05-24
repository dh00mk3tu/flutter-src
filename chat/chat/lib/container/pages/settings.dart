import 'package:chat/container/pages/components/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: Drawer(),
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
          ]
        ),
      ),
    );
  }
}