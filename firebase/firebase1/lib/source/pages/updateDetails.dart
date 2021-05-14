import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/source/pages/drawer.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {

  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User Details"),
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
                onPressed: () {
                  Map<String, dynamic> data = {
                    'field1': name.text,
                    'field2': age.text
                  };
                  FirebaseFirestore.instance.collection("user").add(data);
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}