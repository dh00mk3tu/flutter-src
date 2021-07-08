// import 'dart:io';
// import 'dart:ui';


// import 'package:chat/container/pages/chatbox.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'components/group-show.dart';
// import 'login.dart';

// final CollectionReference groupCollection =
//     FirebaseFirestore.instance.collection('groups');
// bool selectUser = false;
// String url;
// File image;
// User loggedInUser = FirebaseAuth.instance.currentUser;
// final firestore = FirebaseFirestore.instance;
// TabController _tabController;
// // ignore: unused_element
// int _selectedIndex = 0;

// class GroupAddScreen extends StatefulWidget {
//   @override
//   _GroupAddScreenState createState() => _GroupAddScreenState();
// }

// class _GroupAddScreenState extends State<GroupAddScreen>
//     with TickerProviderStateMixin {
//   final authenticator = FirebaseAuth.instance;
//   User loggedInUserChat;
//   String sender;
//   TextEditingController _groupNameController = TextEditingController();
//   TextEditingController _groupIDController = TextEditingController();

//   final TextEditingController _textMessageController = TextEditingController();
//   //
//   //
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   //Try Using Show Dialog with 2 options Cam and Gallery

// // can be void too
//   Future<void> getCurrentUser() async {
//     try {
//       final user = authenticator.currentUser;
//       if (user != null) {
//         loggedInUserChat = user;
//         print(loggedInUserChat.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   static List<String> selectedList = [];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.system,
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.teal[700],
//             title: Row(
//               children: [
//                 Text(
//                   selectedList.length < 1
//                       ? "Select Users"
//                       : "${selectedList.length} users selected",
//                   style: TextStyle(
//                     fontSize: 25,
//                   ),
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
//                           MaterialPageRoute(builder: (context) => ChatBoxScreen("contact")));
//                     },
//                   ),
//                 ),
//                 Tab(
//                   child: TextButton(
//                     child: Text(
//                       'Group',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ShowGroups()));
//                     },
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
//           //
//           //

//           body: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SafeArea(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 16, right: 16, top: 10),
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

//                 // Text(
//                 //   'Choose Users to Create a Group',
//                 //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
//                 // ),
//                 Column(
//                   children: [
//                     Container(
//                       child: StreamBuilder(
//                         stream: FirebaseFirestore.instance
//                             .collection('users')
//                             .orderBy('userName')
//                             .snapshots(),
//                         builder: (BuildContext context, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                               itemCount: snapshot.data.docs.length,
//                               shrinkWrap: true,
//                               padding: EdgeInsets.only(top: 16),
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 DocumentSnapshot cuteUsers =
//                                     snapshot.data.docs[index];
//                                 return Container(
//                                   child: Card(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: InkWell(
//                                         onTap: () {
//                                           selectUser = true;
//                                           setState(() {
//                                             if (selectedList.contains(
//                                                 cuteUsers['userName'])) {
//                                               print('User Present');
//                                               Fluttertoast.showToast(
//                                                   msg:
//                                                       "This user is already selected",
//                                                   toastLength:
//                                                       Toast.LENGTH_SHORT,
//                                                   gravity: ToastGravity.CENTER,
//                                                   timeInSecForIosWeb: 1,
//                                                   backgroundColor: Colors.red,
//                                                   textColor: Colors.white,
//                                                   fontSize: 16.0);
//                                             } else
//                                               selectedList
//                                                   .add(cuteUsers['userName']);
//                                           });
//                                         },
//                                         child: Row(
//                                           children: [
//                                             Container(
//                                               height: 50,
//                                               width: 50,
//                                               child: CircleAvatar(
//                                                 backgroundImage: NetworkImage(
//                                                     cuteUsers['imageUrl']),
//                                               ),
//                                             ),
//                                             SizedBox(width: 20),
//                                             Text(cuteUsers['userName']),
//                                             // if (selectUser = true)
//                                             //   Positioned(
//                                             //     bottom: 4,
//                                             //     right: 5,
//                                             //     child: CircleAvatar(
//                                             //       radius: 11,
//                                             //       child: Icon(Icons.check,
//                                             //           color: Colors.white,
//                                             //           size: 18),
//                                             //     ),
//                                             //   )
//                                             // else
//                                             //   Container()
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
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Card(
//                       child: Form(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 400,
//                               child: TextFormField(
//                                 style: TextStyle(color: Colors.black),
//                                 controller: _groupNameController,
//                                 keyboardType: TextInputType.name,
//                                 decoration: InputDecoration(
//                                   border: UnderlineInputBorder(),
//                                   labelText: 'Group Name',
//                                   hintText: 'Enter Group Name',
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               width: 400,
//                               child: TextFormField(
//                                 style: TextStyle(color: Colors.black),
//                                 controller: _groupIDController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: UnderlineInputBorder(),
//                                   labelText: 'Group ID',
//                                   hintText: 'Enter Group ID',
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 35,
//                             ),
//                             TextButton(
//                               style: ButtonStyle(),
//                               child: Text('Create Group!'),
//                               onPressed: () {
//                                 // var idCreate = _groupIDController.text;
//                                 FirebaseFirestore.instance
//                                     .collection('groups')
//                                     .doc(_groupNameController.text)
//                                     .set({
//                                   'group_id': _groupIDController.text,
//                                   'group_name': _groupNameController.text,
//                                   'users': selectedList,
//                                   'last_msg': _textMessageController.text,
//                                   'last_time': DateTime.now().toString(),
//                                 }).then(
//                                   (value) =>
//                                       // FirebaseFirestore.instance
//                                       //     .collection('groups')
//                                       //     .doc('Group: $idCreate')
//                                       //     .set({}).then(
//                                       //   (value) =>
//                                       FirebaseFirestore.instance
//                                           .collection('groups')
//                                           .doc(
//                                             _groupNameController.text,
//                                           )
//                                           .collection('groupchatz')
//                                           .add(
//                                     {
//                                       'createdAt': DateTime.now().toString(),
//                                       'userId': loggedInUserChat.uid,
//                                       'chatMessage':
//                                           _textMessageController.text,
//                                       'sender': loggedInUserChat.email,
//                                       'messageType': 'Text',
//                                     },
//                                   ),
//                                   // ),
//                                 );
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => ShowGroups()));
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 50),
//                 //
//               ],
//             ),
//           ),
//           //
//           //

//           bottomNavigationBar: BottomNavigationBar(
//             selectedItemColor: Colors.blueGrey,
//             unselectedItemColor: Colors.blueGrey,
//             selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//             type: BottomNavigationBarType.fixed,
//             items: [
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => ChatBoxScreen("contact")));
//                     },
//                     child: Icon(Icons.message)),
//                 label: "Chats",
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(child: Icon(Icons.group)),
//                 label: "Groups",
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => ChatBoxScreen("contact")));
//                     },
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ShowGroups()));
//                         },
//                         child: Icon(Icons.message))),
//                 label: "Show Groups",
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   onTap: () async {
//                     final SharedPreferences sharedPreferences =
//                         await SharedPreferences.getInstance();
//                     sharedPreferences.remove('email');
//                     authenticator.signOut();
//                     Navigator.pop(context);
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LogInScreen()));
//                   },
//                   child: Icon(Icons.logout),
//                 ),
//                 label: "Logout",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
