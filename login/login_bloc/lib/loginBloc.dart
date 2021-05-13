import 'dart:async';

import 'package:login_bloc/check.dart';

// import 'package:rxdart/'
import 'package:rxdart/rxdart.dart';


class Bloc extends Object with Check implements BaseBloc {
  final _emailCon = StreamController<String>();
  final _passCon = StreamController<String>();
  
  Stream<String> get email => _emailCon.stream.transform(emailCheck);
  Stream<String> get pass => _passCon.stream.transform(passCheck);

  // StreamTransformer<String, String> get streamTransformer => null;

  Stream<bool> get subCheck => Rx
  .combineLatest2(email, pass, (e,p)=> true);
  
  @override
  void dispose() {
    _emailCon?.close();
    _passCon?.close();
    
  }

}


abstract class BaseBloc {
  void dispose();
}