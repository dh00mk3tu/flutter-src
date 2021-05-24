import 'package:chat/container/pages/components/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFunction {
  final FirebaseAuth auth = FirebaseAuth.instance;
  
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

  Future registerUser(String name, String email, String pass) async {
    try{
      UserCredential res = await auth.createUserWithEmailAndPassword(
        email: email, 
        password:pass
      );
      User registerUser = res.user;
      return onlineUser(registerUser); 
    }
    catch(e){
      print(e.toString());
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