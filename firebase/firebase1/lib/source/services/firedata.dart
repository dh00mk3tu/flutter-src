import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

dynamic userDat = [];
Future<void> userSetup(String name) async{  
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  
  users.add({
    'userName': name,
    'uid': uid,
  });
  return;
}

Future getUserDetails() async{
  try{
    DocumentSnapshot res = await FirebaseFirestore.instance.collection('users').doc('name').get();
    userDat = res;
    return userDat;
  }
  catch(e) {
    print(e.toString());
    return null;
  }
}