import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBoxScreen extends StatefulWidget {
  @override
  _ChatBoxScreenState createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {


  Widget msgComponent() {
    return Row(
      children: [
        TextFormField(),
        Icon(Icons.send)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        DocumentSnapshot dat = snapshot.data.docs[index];
                            return Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      dat['name']+ ": " + dat['msgs'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  //   )
                                ],
                                ),
                              );
                            },
                          );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              ),
              
            ),
            
            FloatingActionButton(
              backgroundColor: Colors.pink[800],
              child: Icon(Icons.send,
                color: Colors.white,
              ),
              onPressed: (){

              }
            ),
          ],
        ),

      ),
 
    );
  }
}
