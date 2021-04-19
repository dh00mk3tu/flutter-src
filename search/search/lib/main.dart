import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(MaterialApp(
  home : HomePage(),
  theme: ThemeData(
    primarySwatch: Colors.teal,
  )
));


class HomePage extends StatefulWidget {
  @override 
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {
  List data;
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading JSON"),
      ),
      body : Container (
        child: Center(
          child: FutureBuilder (
            future : DefaultAssetBundle
            .of(context) 
            .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              // decode json
              var mydata = json.decode(snapshot.data.toString());

              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Not Name: "+mydata[index]['name']),
                          Text("Age: "+mydata[index]['age']),
                          Text("Height: "+mydata[index]['height']),
                          Text("Gender: "+mydata[index]['gender']),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ?  0: mydata.length,
                );
            },
          )
        )
      )
    ); 
  }
}