import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/source/pages/drawer.dart';
import 'package:firebase1/source/pages/home.dart';
import 'package:firebase1/source/pages/loginState.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  String err="Failed";
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User Details"),
      ),
      drawer: Drawer(
        child: MainDrawer()
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "name",
                  hintText: "update name",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: age,
                decoration: InputDecoration(
                  labelText: "age",
                  hintText: "update age",
                  border: OutlineInputBorder()
                )
              ),
              SizedBox(
                height:20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> data = {
                    'name': name.text,
                    'age': age.text
                  };
                  await FirebaseFirestore.instance.collection("users").add(data);
                  // .catchError((error) => loginError(context, err))
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
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