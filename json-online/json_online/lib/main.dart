import 'package:flutter/material.dart';
import 'dart:async';
// import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Anirudh Rath
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
  int delIndex;
  
  @override 
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var res = await http.get(
      Uri.encodeFull(url),
      //json only 
      // headers: {"Accept": "application/json"}
    );

    print(res.body);

    setState(() {
      var conv = json.decode(res.body);
      data = conv['results'];
    });

    return "Positive";
  }

  DeleteAlert(dynamic val) {
    return showDialog(context: context, builder:(context){
      return AlertDialog(
        title : Text("Are you sure you want to delete?"),
        actions: [
          MaterialButton(
            color : Colors.red,
            elevation: 5.0,
            child: Text("Yes, Delete"),
            onPressed: () {
              // data.removeAt(data[delIndex]);
              setState(() {
                print("here");
                data.removeWhere((data) => data == val);
                Navigator.pop(context);
              });
            },
          ),
        ],
      );
    });
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Online"),
      ),
      body : data == null ? Container(
        
        child: Padding(
          padding: const EdgeInsets.only(top:100.0),
          child: Center(
            child: Column( 
              children: [
                Text("Loading..."),
                new CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ) :

      RefreshIndicator(
          onRefresh: getJsonData,
          child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            delIndex = index; 
            final item = data[index];
            return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  // DeleteAlert(data[index]);

                  item.removeAt(index);

                },
                child: Container(
                child : Center(
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                      // Delete on Swipe
                      // Delete on Icon-Click
                      // Pull to refresh 
                      // On refresh the data must come back as normal
                      // Preloader as the data loads
                      // 
                      child : Padding(
                        padding: const EdgeInsets.all(20.0),
                        // icon : Icon(Icons.delete),
                        child : Container(
                            child : Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data[index]['name']), 
                              // Icon(
                              //   Icons.delete,
                              //   color: Colors.red[700],
                              // ),   
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                tooltip: 'Delete Item',
                                onPressed: (){
                                  // IconButton,
                                  DeleteAlert(data[index]);
                                }
                              )                           
                            ],
                              ),
                    
                        ),

                                            )
                        ),
                    ],
                    
                  )
                )
              ),
            );
          },
        ),
      )
    );
  }
}

Widget Content() {

  
}