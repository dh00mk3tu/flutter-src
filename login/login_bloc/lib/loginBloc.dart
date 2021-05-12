import 'dart:async';

class Bloc implements BaseBloc {
  final _emailCon = StreamController<String>();
  final _passCon = StreamController<String>();
  
  Stream<String> get emailStream => _emailCon.stream.transform(streamTransformer)

  @override
  void dispose() {
    _emailCon?.close();
    _passCon?.close();
    
  }

}


abstract class BaseBloc {
  void dispose();
}