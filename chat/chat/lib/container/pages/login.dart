import 'package:chat/container/pages/components/appbar.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                labelText: "Email",
                fillColor: Color(0xffE9EB81),
                hoverColor: Color(0xffE9EB81),
                // focusColor: Color(0xffFFE2E2),
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
                  
                  child: Text("Sign In",
                    style: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  onPressed: (){

                  }
                ),
                ElevatedButton(
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  onPressed: (){

                  }
                )
              ],
            ),

          ],
        ),
      ),
      
    );
  }
}