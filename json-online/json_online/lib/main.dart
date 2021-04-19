import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() => runApp(MaterialApp(
  home: HomePage(),

));


class HomePage extends StatefulWidget{
  @override 
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  final String url = "https://swapi.dev/api/planets/";
  List data;
  
  @override 
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var res = await http.get(
      Uri.encodeFull(url),
      //json only 
      headers: {"Accept": "application/json"}
    );

    print(res.body);

    setState(() {
      var conv = json.decode(res.body);
      data = conv['results'];
    });

    return "Positive";
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Online"),
      ),
      body : ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child : Center(
              child : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child : Container(
                      child: Text(data[index]['name']),
                      padding: const EdgeInsets.all(10),
                    )
                  )
                ],
              )
            )
          );
        },
      )
    );
  }
}