import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/drawer.dart';
import 'package:chat/container/pages/components/fetchdata.dart';
// import 'package:chat/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatbox.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

FetchUsers userList = FetchUsers();

class _InboxScreenState extends State<InboxScreen> {
  
  QuerySnapshot userDataFetched;


  // Widget userListBuilder() {
  //   return ListView.builder(
  //     itemCount: userDataFetched.docs.length,
  //     itemBuilder: (context, index) {
  //       return StaticUserData(
  //         staticName: userDataFetched.docs[index].data["name"],
  //         staticEmail: userDataFetched.docs[index].data["email"],
  //       );
  //     }
  //   );
  // }
  // superFetch() {
  //   userList.getData().then((val){
  //     // print(val.toString());
  //     setState(() {
  //       userDataFetched = val;
  //     });   
  //   });   
  // }

  // @override
  // void initState() {
  //   superFetch();
  //   super.initState();  
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            
            children: [
              Text("Available Contacts",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2
                ),
              ),
              fetchPeople(),
            ],
          ),
        ),
      )
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => InboxScreen()
      //     ));
      //   },
      // )
    );
  }
}

// message people
// messageState(String recEmail) {
//   List<String> members = [recEmail, senEmail]
//   userList.chatRoom();
// }

Widget fetchPeople() {
  return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
               QueryDocumentSnapshot dat = snapshot.data.docs[index];
              //  print(dat);
                return Card(
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Name: " +dat['name'],
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Email: " +dat['email'], 
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[900]
                        ),
                        child: Text("Message"),
                        onPressed: (){
                          // messageState(dat['email']);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ChatBoxScreen()
                            )
                          );
                        }
                      )
                    ],
                  ),
                );
              },
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
      );
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