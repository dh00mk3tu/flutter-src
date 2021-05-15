import 'package:firebase1/source/pages/drawer.dart';
import 'package:firebase1/source/pages/login.dart';
import 'package:firebase1/source/pages/loginState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _email, _password;
  
  final auth = FirebaseAuth.instance, ok=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register!")
      ),
      drawer: Drawer(
        child: MainDrawer()
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "email"
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password"
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ElevatedButton (
                child: Text("sign up"),
                onPressed: (){
                  // loginSuccess(ok);

                  auth.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password
                  );
                  // .catchError((error) =>);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen()
                    ),
                  );
                },
              ),
              
            ],
          )
        ],
      ),
      
    );
  }
}