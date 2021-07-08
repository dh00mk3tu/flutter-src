// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:chat/container/pages/login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'chatbox.dart';
// import 'components/group-show.dart';

// final firestore = FirebaseFirestore.instance;
// String url;
// File groupImage;

// // ignore: must_be_immutable
// class GroupChats extends StatefulWidget {
//   final String grpname;
//   final List grpusers;
//   GroupChats(this.grpname, this.grpusers);
//   @override
//   _GroupChatsState createState() => _GroupChatsState();
// }

// class _GroupChatsState extends State<GroupChats> {
//   final TextEditingController _textMessageController = TextEditingController();
//   final authenticator = FirebaseAuth.instance;
//   //
//   //
//   //
//   void showAlertDialog() {
//     // ignore: deprecated_member_use
//     Widget cameraButton = FlatButton(
//       child: Text("Camera"),
//       onPressed: getCameraImage,
//     );
//     // ignore: deprecated_member_use
//     Widget galleryButton = FlatButton(
//       child: Text("Gallery"),
//       onPressed: getGallaryImage,
//     );

//     AlertDialog alert = AlertDialog(
//       title: Text("Hello! "),
//       content: Text("Choose Location To Import Image"),
//       actions: [
//         cameraButton,
//         galleryButton,
//       ],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   Future getCameraImage() async {
//     var pictureCamera = (await ImagePicker()
//         .getImage(source: ImageSource.camera, imageQuality: 100));
//     if (pictureCamera != null) {
//       setState(() {
//         groupImage = File(pictureCamera.path);
//         //print(image.readAsBytes());
//         uploadPicCamera(groupImage);
//       });
//     } else {}
//   }

//   //Try Using Show Dialog with 2 options Cam and Gallery
//   Future getGallaryImage() async {
//     var pictureGallery = (await ImagePicker()
//         .getImage(source: ImageSource.gallery, imageQuality: 100));
//     if (pictureGallery != null) {
//       setState(() {
//         groupImage = File(pictureGallery.path);
//         //image.readAsBytes();
//         uploadPicGallery(groupImage);
//       });
//     } else {}
//   }

//   uploadPicGallery(File image) async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     // String url;
//     Reference ref =
//         storage.ref().child('group_images').child(widget.grpname + '.jpg');
//     UploadTask uploadTask = ref.putFile(image);
//     var downloadUrl =
//         await (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();

//     url = downloadUrl.toString();

//     return url;
//   }

//   uploadPicCamera(File image) async {
//     FirebaseStorage storage = FirebaseStorage.instance;

//     Reference ref =
//         storage.ref().child('group_images').child(widget.grpname + '.jpg');
//     UploadTask uploadTask = ref.putFile(image);
//     var downloadUrl =
//         await (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();

//     url = downloadUrl.toString();
//     print(url);
//     return url;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.system,
//       home: Scaffold(
//           endDrawer: Drawer(
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       loggedInUser.email,
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: groupImage != null
//                           ? null
//                           : NetworkImage(
//                               "https://firebasestorage.googleapis.com/v0/b/chatapp-57f30.appspot.com/o/group_images%2F" +
//                                   widget.grpname +
//                                   ".jpg?alt=media&token=9632e6f4-cdfe-4913-af56-027905057e34"),
//                     ),
//                     SizedBox(
//                       width: 30,
//                     ),
//                     ElevatedButton.icon(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.green),
//                       ),
//                       icon: Icon(Icons.photo),
//                       label: Text("Choose Image"),
//                       onPressed: showAlertDialog,
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Logout',
//                     ),
//                     IconButton(
//                       iconSize: 36,
//                       tooltip: 'Logout',
//                       onPressed: () async {
//                         final SharedPreferences sharedPreferences =
//                             await SharedPreferences.getInstance();
//                         sharedPreferences.remove('email');

//                         authenticator.signOut();
//                         Navigator.pop(context);
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LogInScreen()));
//                       },
//                       icon: Icon(Icons.logout),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           appBar: AppBar(
//             brightness: Brightness.dark,
//             automaticallyImplyLeading: false,
//             backgroundColor: Colors.teal[700],
//             flexibleSpace: SafeArea(
//               child: Container(
//                 padding: EdgeInsets.only(right: 16),
//                 child: Row(
//                   children: <Widget>[
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ShowGroups()));
//                       },
//                       icon: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                       ),
//                     ),

//                     SizedBox(
//                       width: 2,
//                     ),
//                     Row(
//                       children: [
//                         //Display Here the Icon of the group
//                         CircleAvatar(
//                           radius: 22,
//                           backgroundImage: groupImage != null
//                               ? null
//                               : NetworkImage(
//                                   "https://firebasestorage.googleapis.com/v0/b/chatapp-57f30.appspot.com/o/group_images%2F" +
//                                       widget.grpname +
//                                       ".jpg?alt=media&token=9632e6f4-cdfe-4913-af56-027905057e34"),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Group: ' + widget.grpname,
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '${widget.grpusers}',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),

//                         Row(
//                           children: [
//                             Icon(
//                               Icons.call,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Icon(
//                               Icons.video_call,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     SizedBox(
//                       width: 12,
//                     ),

//                     //Input TItle for User
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             )),
//                         SizedBox(
//                           height: 6,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           //

//           body: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.85,
//                         child: StreamBuilder(
//                           //use the constructor as widget and show the chats collecton
//                           stream: FirebaseFirestore.instance
//                               .collection('groups')
//                               .doc(widget.grpname)
//                               .collection('groupchatz')
//                               .orderBy('createdAt', descending: true)
//                               .snapshots(),
//                           builder: (BuildContext context, snapshot) {
//                             if (snapshot.hasData) {
//                               return ListView.builder(
//                                 reverse: true,
//                                 itemCount: snapshot.data.docs.length,

//                                 //chats ke upar neeche ka space
//                                 padding: EdgeInsets.only(top: 10, bottom: 10),
//                                 itemBuilder: (context, index) {
//                                   var messages =
//                                       snapshot.data.docs[index]['chatMessage'];
//                                   var time =
//                                       snapshot.data.docs[index]['createdAt'];

//                                   ChatBoxScreen object =
//                                       ChatBoxScreen("contact");
//                                   if (snapshot.data.docs[index]
//                                           ['messageType'] ==
//                                       'Image') {
//                                     Uint8List imageList = base64Decode(snapshot
//                                         .data.docs[index]['chatMessage']);
//                                     object.img = Image.memory(imageList);
//                                   }

//                                   //Bottom container is for showing messages
//                                   return Row(
//                                     mainAxisAlignment: snapshot.data.docs[index]
//                                                 ["sender"] ==
//                                             FirebaseAuth
//                                                 .instance.currentUser.email
//                                         ? MainAxisAlignment.end
//                                         : MainAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           padding: EdgeInsets.only(
//                                               left: 14,
//                                               right: 14,
//                                               top: 10,
//                                               bottom: 10),
//                                           child: Align(
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                               ),

//                                               //Design Chats
//                                               child: Material(
//                                                 borderRadius: snapshot.data
//                                                                 .docs[index]
//                                                             ["sender"] ==
//                                                         FirebaseAuth.instance
//                                                             .currentUser.email
//                                                     ? BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(
//                                                                 50.0),
//                                                         bottomRight:
//                                                             Radius.circular(
//                                                                 50.0),
//                                                         bottomLeft:
//                                                             Radius.circular(
//                                                                 50.0))
//                                                     : BorderRadius.only(
//                                                         topRight:
//                                                             Radius.circular(50.0),
//                                                         bottomRight: Radius.circular(50.0),
//                                                         bottomLeft: Radius.circular(50.0)),

//                                                 // Show Text
//                                                 child: Row(
//                                                   children: [
//                                                     Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         (snapshot.data.docs[
//                                                                         index][
//                                                                     'messageType'] ==
//                                                                 'Image')
//                                                             ? Container(
//                                                                 child:
//                                                                     object.img,
//                                                                 height: 150,
//                                                                 width: 150,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               30),
//                                                                 ),
//                                                               )
//                                                             : Container(
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: snapshot.data.docs[index]
//                                                                               [
//                                                                               "sender"] ==
//                                                                           FirebaseAuth
//                                                                               .instance
//                                                                               .currentUser
//                                                                               .email
//                                                                       ? Colors.teal[
//                                                                           200]
//                                                                       : Colors
//                                                                           .black12,
//                                                                   borderRadius: BorderRadius.only(
//                                                                       topLeft: Radius
//                                                                           .circular(
//                                                                               50.0),
//                                                                       bottomRight:
//                                                                           Radius.circular(
//                                                                               50.0),
//                                                                       bottomLeft:
//                                                                           Radius.circular(
//                                                                               50.0)),
//                                                                 ),
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(
//                                                                             15.0),
//                                                                 child: Row(
//                                                                   children: [
//                                                                     Text(
//                                                                       messages,
//                                                                       style:
//                                                                           TextStyle(
//                                                                         fontSize:
//                                                                             20,
//                                                                       ),
//                                                                     ),
//                                                                     SizedBox(
//                                                                       width: 15,
//                                                                     ),
//                                                                     Text(
//                                                                       time,
//                                                                       style:
//                                                                           TextStyle(
//                                                                         fontSize:
//                                                                             12,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             } else
//                               return Center(child: CircularProgressIndicator());
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 //
//                 //

//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   width: MediaQuery.of(context).size.width,
//                   child: Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
//                       height: MediaQuery.of(context).size.height,
//                       width: double.infinity,
//                       color: Colors.white,
//                       child: Row(
//                         children: <Widget>[
//                           //

//                           SizedBox(
//                             width: 30,
//                           ),
//                           Icon(Icons.emoji_emotions),
//                           SizedBox(
//                             width: 30,
//                           ),
//                           Expanded(
//                             child: TextFormField(
//                               onChanged: (value) {
//                                 setState(() {});
//                               },
//                               style: TextStyle(),
//                               controller: _textMessageController,
//                               decoration: InputDecoration(
//                                   hintText: ("Write message..."),
//                                   hintStyle: TextStyle(
//                                       color: Colors.black54, fontSize: 17),
//                                   border: InputBorder.none),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 30,
//                             width: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                             child: RawMaterialButton(
//                               fillColor: Colors.white,
//                               shape: CircleBorder(),
//                               onPressed: () {
//                                 showModalBottomSheet(
//                                     elevation: 30,
//                                     isScrollControlled: true,
//                                     isDismissible: true,
//                                     enableDrag: true,
//                                     backgroundColor: Colors.transparent,
//                                     context: context,
//                                     builder: (builder) => bottomSheet());
//                               },
//                               child: Icon(Icons.camera_alt, size: 20),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 30,
//                             width: 30,
//                             decoration: BoxDecoration(
//                               color: Colors.lightBlue,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: GestureDetector(
//                               onTap: () async {
//                                 await _sendTextMessage(context);

//                                 _textMessageController.clear();
//                               },
//                               child: Icon(
//                                 Icons.send,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   Widget bottomSheet() {
//     return Container(
//       height: 270,
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(35.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => GroupCameraScreen()));
//                     },
//                     child: CircleAvatar(
//                       radius: 28,
//                       backgroundColor: Colors.blueAccent[100],
//                       child: Icon(
//                         Icons.camera_alt,
//                         size: 50,
//                         color: Colors.blueAccent[600],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.blueGrey[200],
//                     child: Icon(
//                       Icons.image,
//                       size: 50,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   CircleAvatar(
//                       backgroundColor: Colors.purpleAccent,
//                       radius: 28,
//                       child: Icon(Icons.audiotrack,
//                           size: 50, color: Colors.purple)),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   CircleAvatar(
//                       radius: 28,
//                       backgroundColor: Colors.green[200],
//                       child: Icon(Icons.location_on,
//                           size: 50, color: Colors.green)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundColor: Colors.tealAccent[200],
//                   child: Icon(
//                     Icons.file_copy,
//                     size: 50,
//                     color: Colors.teal,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 CircleAvatar(
//                     backgroundColor: Colors.orangeAccent[100],
//                     radius: 28,
//                     child: Icon(Icons.payment, size: 50, color: Colors.orange)),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.green[200],
//                     child: Icon(Icons.contact_page_outlined,
//                         size: 50, color: Colors.grey)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   User loggedInUser = FirebaseAuth.instance.currentUser;
//   Future _sendTextMessage(BuildContext context) async {
//     if (_textMessageController.text != null) {
//       FirebaseFirestore.instance
//           .collection('groups')
//           .doc(widget.grpname)
//           .collection('groupchatz')
//           .add(
//         {
//           'createdAt': DateTime.now().toString(),
//           'userId': loggedInUserChat.uid,
//           'chatMessage': _textMessageController.text,
//           'sender': loggedInUserChat.email,
//           'messageType': 'Text',
//         },
//       );
//       FirebaseFirestore.instance
//           .collection('groups')
//           .doc(widget.grpname)
//           .update({
//         'last_msg': _textMessageController.text,
//         'last_time': DateTime.now().toString(),
//       });
//     }
//     FocusScope.of(context).unfocus();
//   }
// }
