import 'package:cloud_firestore/cloud_firestore.dart';

class FetchUsers {
  postData(userData) {
    FirebaseFirestore.instance.collection("users").add(userData);
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("users").get();
    // print("users");
  }

  chatRoom(String chatRoomId, chatRoomMap){
    FirebaseFirestore.instance.collection("ChatRoom")
      .doc(chatRoomId).set(chatRoomMap).catchError((e){
        print(e.toString());
      });
  }
}