import 'package:flutter/material.dart';
import 'package:news/beauty/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/pages/drawer.dart';
import 'package:news/services/api.dart';

import 'package:news/model/article.dart';
import 'package:news/services/techAPI.dart';

import '../main.dart';


void main() {
  runApp(TechPageApp());
}

class TechPageApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TechPage(),
    );
  }
}

class TechPage extends StatefulWidget {
  @override
  _TechPageState createState() => _TechPageState();
}


class _TechPageState extends State<TechPage> {

  TechApiGet hehe = TechApiGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "completely accurate tech news",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      drawer : Drawer(
        child: MainDrawer()
      ),
      
      body: FutureBuilder(
        future: hehe.getTechArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData) {
            List <Article> articles = snapshot.data;
            // return Center(
            //   child: Text("news t ime"),
            // );

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index)=> Card(
                child: niceList(articles[index]),
              )
            );
          }
          return Center (
            child: CircularProgressIndicator(),
          ); 
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyApp()
          ));
        },
      ),
      
    );
  }
}