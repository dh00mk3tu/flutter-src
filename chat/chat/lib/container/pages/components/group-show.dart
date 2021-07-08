// import 'dart:io';

// import 'package:chat/container/pages/login.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../chatbox.dart';
// import '../group-add.dart';
// import '../group-chat.dart';

// final CollectionReference groupCollection =
//     FirebaseFirestore.instance.collection('groups');
// bool selectUser = false;
// String url;
// File image;
// User loggedInUserChat = FirebaseAuth.instance.currentUser;
// final firestore = FirebaseFirestore.instance;

// // ignore: must_be_immutable
// class ShowGroups extends StatefulWidget {
//   var groupId;
//   ShowGroups({this.groupId});
//   @override
//   _ShowGroupsState createState() => _ShowGroupsState();
// }

// class _ShowGroupsState extends State<ShowGroups> with TickerProviderStateMixin {
//   final authenticator = FirebaseAuth.instance;
//   String grpname;
//   String sender;
//   TabController _tabController;
//   int _selectedIndex = 0;
//   //
//   //
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//     _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
//     _tabController.addListener(() {
//       setState(() {
//         _selectedIndex = _tabController.index;
//       });
//       print("Selected Index: " + _tabController.index.toString());
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

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
//         image = File(pictureCamera.path);
//         //print(image.readAsBytes());
//         uploadPicCamera(image);
//       });
//     } else {}
//   }

//   //Try Using Show Dialog with 2 options Cam and Gallery
//   Future getGallaryImage() async {
//     var pictureGallery = (await ImagePicker()
//         .getImage(source: ImageSource.gallery, imageQuality: 100));
//     if (pictureGallery != null) {
//       setState(() {
//         image = File(pictureGallery.path);
//         //image.readAsBytes();
//         uploadPicGallery(image);
//       });
//     } else {}
//   }

//   uploadPicGallery(File image) async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     // String url;
//     Reference ref =
//         storage.ref().child('user_images').child(loggedInUserChat.uid + '.jpg');
//     UploadTask uploadTask = ref.putFile(image);
//     var downloadUrl =
//         await (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();

//     url = downloadUrl.toString();

//     return url;
//   }

//   uploadPicCamera(File image) async {
//     FirebaseStorage storage = FirebaseStorage.instance;

//     Reference ref =
//         storage.ref().child('user_images').child(loggedInUserChat.uid + '.jpg');
//     UploadTask uploadTask = ref.putFile(image);
//     var downloadUrl =
//         await (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();

//     url = downloadUrl.toString();
//     print(url);
//     return url;
//   }

// // can be void too
//   Future<void> getCurrentUser() async {
//     try {
//       final user = authenticator.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.system,
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           drawer: Drawer(
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       'Logged-In Email: ',
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
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
//                         radius: 50,
//                         backgroundImage: image != null
//                             ? NetworkImage(
//                                 "https://firebasestorage.googleapis.com/v0/b/chatapp-57f30.appspot.com/o/user_images%2F" +
//                                     loggedInUserChat.uid +
//                                     ".jpg?alt=media&token=e331836a-8159-46c6-bfaa-857ed7664b32")
//                             : null),
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
//             backgroundColor: Colors.teal[700],
//             title: Row(
//               children: [
//                 Icon(Icons.group),
//                 Text(
//                   " GroupChats",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             bottom: TabBar(
//               controller: _tabController,
//               isScrollable: true,
//               tabs: <Widget>[
//                 Tab(
//                   child: TextButton(
//                     child: Text(
//                       'Chats',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => ChatBoxScreen("")));
//                     },
//                   ),
//                 ),
//                 Tab(
//                   child: TextButton(
//                     child: Text(
//                       'Group',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 Tab(
//                   child: TextButton(
//                     child: Text(
//                       'Calls',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SafeArea(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 16, right: 16, top: 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         SizedBox(width: 10),
//                       ],
//                     ),
//                   ),
//                 ),
//                 //

//                 //Search Area For COnversations
//                 Column(
//                   children: [
//                     Container(
//                       child: StreamBuilder(
//                         stream: FirebaseFirestore.instance
//                             .collection('groups')
//                             .snapshots(),
//                         builder: (BuildContext context, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                               itemCount: snapshot.data.docs.length,
//                               shrinkWrap: true,
//                               padding: EdgeInsets.only(top: 16),
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   child: Card(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: InkWell(
//                                         onTap: () {
//                                           print(snapshot.data.docs[index]
//                                               ['users']);
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       GroupChats(
//                                                         snapshot.data
//                                                                 .docs[index]
//                                                             ['group_name'],
//                                                         snapshot.data
//                                                                 .docs[index]
//                                                             ['users'],
//                                                       )));
//                                         },
//                                         child: Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundImage: snapshot.hasError
//                                                   ? null
//                                                   // ? NetworkImage(
//                                                   //     "https://blogtimenow.com/wp-content/uploads/2014/06/hide-facebook-profile-picture-notification.jpg")
//                                                   : NetworkImage(
//                                                       "https://firebasestorage.googleapis.com/v0/b/chatapp-57f30.appspot.com/o/group_images%2F" +
//                                                           snapshot.data
//                                                                   .docs[index]
//                                                               ['group_name'] +
//                                                           ".jpg?alt=media&token=9632e6f4-cdfe-4913-af56-027905057e34"),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             Container(
//                                               height: 40,
//                                               width: 100,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     snapshot.data.docs[index]
//                                                         ['group_name'],
//                                                     style: TextStyle(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   // Text(
//                                                   //   snapshot.data.docs[index]
//                                                   //       ['group_name'],
//                                                   //   style:
//                                                   //       TextStyle(fontSize: 15),
//                                                   // ),
//                                                   StreamBuilder(
//                                                       stream: FirebaseFirestore
//                                                           .instance
//                                                           .collection("groups")
//                                                           .snapshots(),
//                                                       builder:
//                                                           (context, snapshot) {
//                                                         print(snapshot
//                                                             .data
//                                                             .docs[index]
//                                                                 ["last_msg"]
//                                                             .toString());
//                                                         return Text(
//                                                           snapshot
//                                                               .data
//                                                               .docs[index]
//                                                                   ["last_msg"]
//                                                               .toString(),
//                                                         );
//                                                       }),
//                                                 ],
//                                               ),
//                                             ),
//                                             Spacer(),
//                                             StreamBuilder(
//                                                 stream: FirebaseFirestore
//                                                     .instance
//                                                     .collection("groups")
//                                                     .snapshots(),
//                                                 builder: (context, snapshot) {
//                                                   print(snapshot.data
//                                                       .docs[index]["last_time"]
//                                                       .toString());
//                                                   return Text(
//                                                     snapshot
//                                                         .data
//                                                         .docs[index]
//                                                             ["last_time"]
//                                                         .toString(),
//                                                   );
//                                                 }),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           }
//                           return Container();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 50),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             tooltip: 'New Group',
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => GroupAddScreen()));
//             },
//             elevation: 10,
//             child: const Icon(Icons.group),
//             backgroundColor: Colors.teal[600],
//           ),
//         ),
//       ),
//     );
//   }
// }
