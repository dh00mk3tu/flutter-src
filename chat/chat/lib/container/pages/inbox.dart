import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:chat/container/pages/components/fetchdata.dart';
// import 'package:chat/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'chatbox.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

FetchUsers userList = FetchUsers();
final _storage = FirebaseStorage.instance;

class _InboxScreenState extends State<InboxScreen> {
  QuerySnapshot userDataFetched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: MainAppbar(context),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                fetchPeople(),
              ],
            ),
          ),
        ));
  }
}
String contact; 
Widget fetchPeople() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              QueryDocumentSnapshot dat = snapshot.data.docs[index];
              //  print(dat);
              return ListTile(
                onTap: () {
                  // print(dat['name']);
                  contact = dat['displayName'];
                  print("$contact");
                  Navigator.push(
                    context, 
                    
                    MaterialPageRoute(
                      builder: (context) => ChatBoxScreen(contact)
                    )
                  );
                },
                leading: CircleAvatar(
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.blue,
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      dat['displayName'],
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                trailing: Text(
                  dat['email']
                ),
                // subtitle: new Container(
                //   child: new Text(
                //     details[i].message,
                //     style: new TextStyle(color: Colors.black),
                //   ),
                // ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
// class StaticUserData extends StatelessWidget {
//   final String staticName;
//   final String staticEmail;
//   StaticUserData({this.staticName, this.staticEmail});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Text(staticName),
//               Text(staticEmail),
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }
