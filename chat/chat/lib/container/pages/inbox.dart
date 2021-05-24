import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:chat/services/authenticate.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: MainDrawer(),
    );
  }
}