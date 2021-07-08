// import 'dart:html';

// import 'package:chat/container/pages/components/appbar.dart';
// import 'package:chat/container/pages/components/drawer.dart';
// import 'package:chat/container/pages/typemessage.dart';
import 'package:chat/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'components/chatAppBar.dart';
import 'package:intl/intl.dart';
import 'dart:io';

String contact;
final _storage = FirebaseStorage.instance;
String downURL;
String type = "Text";

class ChatBoxScreen extends StatefulWidget {
  @override
  _ChatBoxScreenState createState() => _ChatBoxScreenState();

  ChatBoxScreen(String contactName) {
    contact = contactName;
  }
}

File image, retImage;

class _ChatBoxScreenState extends State<ChatBoxScreen> {
  var currEmail;

  User loggedInUser = FirebaseAuth.instance.currentUser;
  DocumentReference<Map<String, dynamic>> user =
      FirebaseFirestore.instance.collection("users").doc();
  // DocumentSnapshot name = FirebaseFirestore.instance.collection("users").get() as DocumentSnapshot<Object>;

  TextEditingController msg = TextEditingController();
  // Widget msgComponent() {
  //   return Row(
  //     children: [TextFormField(), Icon(Icons.send)],
  //   );
  // }

  DateTime now = DateTime.now();
  AuthFunction parseData = AuthFunction();
  var indexer = 0;

  // currEmail = parseData.currUser();
  // print("$parseData.copyData()");
  @override
  // initState() {
  //   currEmail = parseData.currUser();
  //   // print(currEmail.toString());
  //   // currEmail = currEmail.toString();
  //   super.initState();
  // }

  String imageUrl;
  final picker = ImagePicker();
  Future _openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        image = File(pickedFile.path);
        retImage = image;
        Navigator.pop(context);
        _imageConf(context);
      } else {
        return Text("No image Selected!");
      }
    });
  }

  Future _openCamera() async {
    final clickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (clickedFile != null) {
        image = File(clickedFile.path);
        retImage = image;
        Navigator.pop(context);
        _imageConf(context);
      } else {
        return Text("No image Selected!");
      }
    });
  }

  Future<void> _openPicker(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Select an option"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    GestureDetector(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Gallery"),
                          ),
                          onPressed: () {
                            _openGallery();
                          }),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Camera"),
                          ),
                          onPressed: () {
                            _openCamera();
                          }),
                    ),
                    ElevatedButton(
                        child: Text("Cancel!"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ));
        });
  }

  Future<void> _imageConf(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Share this Image?",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Card(
                      child: image == null
                          ? Icon(Icons.person_outlined)
                          : Image.file(image),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Cancel Button
                        ElevatedButton(
                            child: Icon(Icons.cancel), 
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        // Send Button
                        ElevatedButton(
                            child: Icon(Icons.send), 
                            onPressed: () async {
                              var snapshot = await _storage.ref()
                              .child('Media/image')
                              .putFile(image);
                              
                              downURL = await FirebaseStorage.instance
                                .ref('Media/image')
                                .getDownloadURL();
                              print("$downURL");
                              type = "Media";
                              
                              Navigator.pop(context);
                              // var imageUrl = await ref.getDownloadURL();                              
                            }
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }

  returnPath() {
    return image;
  }

  // var contac = "$contact";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppbar(context, contact),
      // drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                // alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user1_msg")
                                .orderBy("time", descending: false)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.docs.length,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot dat =
                                        snapshot.data.docs[index];

                                    return Row(
                                      mainAxisAlignment:
                                          snapshot.data.docs[index]["sender"] ==
                                                  FirebaseAuth.instance
                                                      .currentUser.email
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 10,
                                                top: 10,
                                                bottom: 10),
                                            child: Align(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  50.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  50.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  50.0)),
                                                  child: Row(
                                                    children: [
                                                      (snapshot.data.docs[index]["type"] == "Image") ?
                                                      Container (
                                                        child: Image.network(downURL,
                                                          fit: BoxFit.cover
                                                        ),
                                                        
                                                      ) 
                                                      : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: snapshot.data.docs[index]["sender"] == FirebaseAuth
                                                                      .instance
                                                                      .currentUser
                                                                      .email
                                                              ? Colors.teal[600]
                                                              : Colors
                                                                  .grey[400],
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      50.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          50.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      50.0)),
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(12),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              dat['msg-u1'],
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              dat['time']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                            ),
                                                            // DateTime.now(),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                    // return Container(
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //   ),
                                    //   child: Material(
                                    //       borderRadius: BorderRadius.only(
                                    //                 topLeft: Radius.circular(50.0),
                                    //                 bottomRight: Radius.circular(50.0),
                                    //                 bottomLeft: Radius.circular(50.0)),
                                    //     child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Padding(
                                    //           padding: const EdgeInsets.all(15.0),
                                    //           child: Text(
                                    //             dat['msg-u1'],
                                    //             style: TextStyle(
                                    //                 fontSize: 14,
                                    //                 fontWeight: FontWeight.bold),
                                    //           ),
                                    //         ),
                                    //         //   )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),

                      // SizedBox(
                      //   child : Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: TextField(
                      //       controller: msg,
                      //     ),
                      //   )
                      // ),
                      // ElevatedButton(
                      //   child: Text("Send A Message"),
                      //   onPressed: () async {
                      //     Map<String, dynamic> data = {
                      //       "msg-u1": msg.text
                      //     };
                      //     await FirebaseFirestore.instance.collection('user1_msg').add(data);
                      //   }
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: msg,
                        decoration:
                            InputDecoration(hintText: "Enter Your Message")),
                  )),
                  ElevatedButton(
                      child: Icon(Icons.attach_file),
                      onPressed: () async {
                        _openPicker(context);
                      }),
                  SizedBox(width: 5),
                  ElevatedButton(
                      child: Icon(Icons.send),
                      // child: Text("Send A Message"),
                      onPressed: () async {
                        indexer += 1;
                        if (msg.text == "") {
                          print("Empty Message");
                        } else {
                          type = "Text";
                          Map<String, dynamic> data = {
                            "msg-u1": msg.text,
                            "time": DateFormat.Hm().format(now).toString(),
                            "index": indexer,
                            "sender": loggedInUser.email,
                            "type": type,
                            "imageUrl": downURL,
                          };

                          await FirebaseFirestore.instance
                              .collection('user1_msg')
                              .add(data);
                        }
                        setState(() {
                          msg.text = "";
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Uploading Images

// Permissions
