import 'dart:async';

mixin Check {
  var emailCheck = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains("@")){
        sink.add(email);
      }
    }
  ); 
}