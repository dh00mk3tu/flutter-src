import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe To Dismiss',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  final List<String> items = new List<String>.generate(30, (i) => "Items  ${i+1}");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          final item = items[index];
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text("Item Dismissed"),
              ));
            },
            background: Container(
              color: Colors.red[800],
            ),
            child: ListTile(
              title: new Text("${items[index]}")
            )
          );
        },
      )
    );
  }
}
