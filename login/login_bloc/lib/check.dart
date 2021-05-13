import 'dart:async';

mixin Check {
  var emailCheck = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains("@")){
        sink.add(email);
      }
      else {
        sink.addError("no");
      }
    }
  );

  var passCheck = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length>4){
        sink.add(password);
      }
      else {
        sink.addError("bad password");
      }
    }
  );  
}