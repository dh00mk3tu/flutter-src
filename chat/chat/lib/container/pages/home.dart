import 'package:flutter/material.dart';

import 'components/CallsScreen.dart';
import 'components/CameraScreen.dart';
import 'components/StatusScreen.dart';
import 'components/drawer.dart';
import 'inbox.dart';


class WhatsappHome extends StatefulWidget {
  WhatsappHome({Key key}) : super(key: key);
  @override
  _WhatsappHomeState createState() => _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
        elevation: 5,
        title: Text("WhatsApp 3"),
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Container(
              width: 20,
              height: 50,
              alignment: Alignment.center,
              child: Icon(
                Icons.camera_alt,
              ),
            ),
            Container(
                width: 80,
                height: 50,
                alignment: Alignment.center,
                child: Text("CHATS")),
            Container(
                width: 80,
                height: 50,
                alignment: Alignment.center,
                child: Text("STATUS")),
            Container(
                width: 80,
                height: 50,
                alignment: Alignment.center,
                child: Text("CALL"))
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          CameraScreen(),
          InboxScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("Open Chats")},
        backgroundColor: Colors.greenAccent.shade700,
        child: Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
