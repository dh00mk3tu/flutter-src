import 'package:chat/container/pages/components/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFunction {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> user = FirebaseFirestore.instance.collection("users").doc().get();

  String userEmail;

  UserOnline onlineUser(User user){
    return user !=null ? UserOnline(userId: user.uid): null;
  }
   
  Future LogIn(String email, String pass) async {
    try {
      UserCredential getRes = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass
      );
      User signInUser = getRes.user;
      return onlineUser(signInUser); 
    }
    catch(e) {
      print(e.toString());
    }
  } 


  Future copyData(String email) async {
    userEmail = email;
    return userEmail;
  }


  currUser() {
    print(user); 
    return "user";
  }

  Future registerUser(String name, String email, String pass) async {
    print("registering...");
    print("$email");
    print("$pass");
    try{
      UserCredential res = await auth.createUserWithEmailAndPassword(
        email: email, 
        password:pass
      );
      print("test");

      User registerUser = res.user;
      return onlineUser(registerUser); 
    }
    catch(e){
      e.toString();
      print(e);
    }
  }

  Future LogOut() async {
    try {
      return await auth.signOut();
    }
    catch(e){

    }
  }

}
