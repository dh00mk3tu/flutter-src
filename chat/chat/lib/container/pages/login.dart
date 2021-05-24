import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/inbox.dart';
import 'package:chat/container/pages/register.dart';
import 'package:chat/services/authenticate.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  
  // final Function stateCheck;
  // LogIn(this.stateCheck);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  AuthFunction parseData = AuthFunction();
  bool isLoggedIn = false;
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
          children: [
            Center(
              child: Text("Please Sign In",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
            SizedBox(
              height: 65,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                labelText: "Email",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 4.0,
                )
              ),
            ),
            SizedBox(
              height:25
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                labelText: "Passowrd",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 4.0,
                )
              ),
            ),
            SizedBox(
              height: 50
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[700]
                  ),          
                  child: Text("Sign In",
                    style: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  onPressed: (){
                    parseData.LogIn(name.text, password.text);
                    if (isLoggedIn) {
                      CircularProgressIndicator();
                    }
                    else {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => InboxScreen()
                      ));
                    }

                  }
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[700]
                  ),
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => RegisterScreen()
                      ),
                    );
                  }
                )
              ],
            ),
            SizedBox(
              height:15
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400]
              ),
              child: Text("Register With Google",),
              
              onPressed: (){
                // LogIn();
              }
            )
          ],
        ),
      ),
      
    );
  }
}