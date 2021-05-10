import 'package:flutter/material.dart';
import 'package:news/style/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/container/pages/drawer.dart';
// import 'package:news/services/api.dart';

import 'package:news/class/article.dart';
import 'package:news/container/api/businessAPI.dart';
// import 'package:news/services/techAPI.dart';

import 'package:news/main.dart';


void main() {
  runApp(BusinessPageApp());
}

class BusinessPageApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusinessPage(),
    );
  }
}

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}


class _BusinessPageState extends State<BusinessPage> {

  BusinessApiGet hehe = BusinessApiGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "completely accurate business news",
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
        future: hehe.getBusinessArticle(),
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