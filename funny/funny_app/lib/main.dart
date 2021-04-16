import 'package:flutter/material.dart';

// void main() {
//    runApp(FunnyApp());
// }

void main() => runApp(FunnyApp());

class FunnyApp extends StatelessWid get {
  @override
  Widget build(BuildContext context) {
    var ques = [
      'What is your fruit',
      'Why are you',
      'Watermelon???',
    ];

    void ans() {
      print("aahahaaaa");
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Funny App'),
        ),
        body: Column(
          
          children: [
            Text('koshun'),
            ElevatedButton(
              child: Text('haha chinez'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: ans,
            ),
            Center(
              child: RaisedButton(
                child: Text('??!?!??'),
                onPressed: ans,
              ),
            ),
            RaisedButton(
              child: Text('??????'),
              onPressed: ans,
            ),
            RaisedButton(
              child: Text('funmy'),
              onPressed: ans,
            ),
          ],
        ),
      ),
    );
  }
}
