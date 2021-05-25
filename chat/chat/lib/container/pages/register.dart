import 'package:chat/container/pages/components/appbar.dart';
import 'package:chat/container/pages/components/fetchdata.dart';
import 'package:chat/container/pages/inbox.dart';
import 'package:chat/services/authenticate.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

AuthFunction parseData = AuthFunction();
FetchUsers parseUsers = FetchUsers();

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final valid = GlobalKey<FormState>();
  final atTheRate =  "@";
  bool loading = false;
  logInValid() {
    if (valid.currentState.validate()) {
      //  return ;

      Map<String, String> userData = {
        "name" : name.text,
        "email": email.text,
      };
      print("hehe");
      setState(() {
        loading = true;
      });
      parseData.registerUser(name.text, email.text, password.text).then((res){
        print("$res");


        parseUsers.postData(userData);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => InboxScreen()
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(context),
      body: loading ? Center(child: CircularProgressIndicator()) : Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(height: 5),
              Text("Please enter your details to register",
                  style: TextStyle(
                    fontSize: 25,
                  )),
              SizedBox(height: 15),
              Form(
                key: valid,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (val) {
                        return val.isEmpty ? "no" : null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "bad email" : null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "bad password" : null;
                      },
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // SizedBox(
              //     height:45
              //   ),
              ElevatedButton(
                  child: Text("Register",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  onPressed: () {
                    logInValid();
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
