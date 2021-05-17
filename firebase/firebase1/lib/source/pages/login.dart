import 'package:firebase1/source/pages/home.dart';
import 'package:firebase1/source/pages/loginState.dart';
import 'package:firebase1/source/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _email, _password, _error,_ok;
  var status = 0;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("login to kar pehle",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold

            )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "email bata be",
                border: OutlineInputBorder(),
                labelText: "emaillllllll"
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
                hintText: "password bata",
                border: OutlineInputBorder(),
                labelText: "password",
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
              ElevatedButton(
                child: Text("sign in"),
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                      email: _email,
                      password: _password
                    );
                    CircularProgressIndicator();
                    status = 1; 
                  }
                  catch (e) {
                    _error = e.toString();
                    loginError(context, _error);
                  }
                  if(status == 1) {
                    _ok = "Success!";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds:1),
                        content: Text("$_ok"),
                      )
                    );
                    // LoginSuccess();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen()
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                child: Text("or register"),
                onPressed: (){
                  // auth.createUserWithEmailAndPassword(
                  //   email: _email,
                  //   password: _password
                  // );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen()
                    ),
                  );
                },
              ),
            ],
          )
        ],
      )
    );
  }
}

