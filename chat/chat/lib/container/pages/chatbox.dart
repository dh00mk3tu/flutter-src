import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:chat/container/pages/typemessage.dart';
import 'package:chat/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBoxScreen extends StatefulWidget {
  @override
  _ChatBoxScreenState createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {

  var currEmail;
  TextEditingController msg = TextEditingController();
  Widget msgComponent() {
    return Row(
      children: [
        TextFormField(),
        Icon(Icons.send)
      ],
    );
  }

  AuthFunction parseData = AuthFunction();

  // currEmail = parseData.currUser();
  // print("$parseData.copyData()");
  @override
  initState(){
    currEmail = parseData.currUser();
    // print(currEmail.toString());
    // currEmail = currEmail.toString();
    super.initState();
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
                stream: FirebaseFirestore.instance.collection("user1_msg").snapshots(),
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
                                      "$currEmail" + ": " + dat['msg-u1'],
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
            SizedBox(
              child : Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: msg,
                ),
              )
            ),
            ElevatedButton(
              child: Text("Send A Message"),
              onPressed: () async {
                Map<String, dynamic> data = {
                  "msg-u1": msg.text
                };
                await FirebaseFirestore.instance.collection('user1_msg').add(data);
              }
            ),
            
            // FloatingActionButton(
            //   backgroundColor: Colors.pink[800],
            //   child: Icon(Icons.send,
            //     color: Colors.white,
            //   ),
            //   onPressed: (){
            //     return showDialog(
            //       context: context,
            //       builder: (context) => AlertDialog(
            //         title: Text("Please Type Your Message"),
            //         // content: TextField(),
            //         actions: <Widget>[
                      
            //       ],
            //       )
            //     );
            //   }
            // ),
          ],
        ),

      ),
 
    );
  }
}
