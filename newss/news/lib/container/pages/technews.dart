import 'package:flutter/material.dart';
import 'package:news/style/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/container/pages/drawer.dart';
// import 'package:news/services/api.dart';

import 'package:news/class/article.dart';
import 'package:news/container/api/techAPI.dart';

import 'package:news/main.dart';


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
      // body: StreamBuilder()
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
                child: niceList(articles[index], context),
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