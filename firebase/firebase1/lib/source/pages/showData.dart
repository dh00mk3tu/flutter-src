import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/source/pages/drawer.dart';
import 'package:firebase1/source/pages/home.dart';
import 'package:firebase1/source/services/firedata.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();


}

class _DisplayScreenState extends State<DisplayScreen> {
  
  List userProfile = [];
  @override 
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // fetchData() async {
  //   dynamic res = await getUserDetails();
  //   // userProfile = res;
  //   print(res);
  //   if (res == null){
  //     print("failed!!");
  //   } 
  //   else {
  //     print(res);
  //     print("hehe");
  //     // for (int i = 0; i < userProfile.length; i++){
  //     //   print(userProfile[i]);
  //     // }
  //   }
  //   // else {
  //   //   setState(() {
  //   //     userProfile = res; 
  //   //   });
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Displaying Data "),
      ),
      drawer: Drawer(
        child: MainDrawer()
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                DocumentSnapshot dat = snapshot.data.documents[index];
                return Card(
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Name: " +dat['name'],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Age: " +dat['age'], 
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen()
                ),
              );
        },
      ),
    );
  }
} 