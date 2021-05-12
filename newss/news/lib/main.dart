import 'package:flutter/material.dart';
import 'package:news/style/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/container/pages/drawer.dart';
import 'package:news/container/api/api.dart';

import 'class/article.dart';

//  


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  ApiGet hehe = ApiGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "completely accurate news",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      drawer : Drawer(
        child: MainDrawer()
      ),
      
      body: RefreshIndicator(
          onRefresh: () {
            return Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyApp() 
            ));
          },
          child: FutureBuilder(
          future: hehe.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
            if(snapshot.hasData) {
              List <Article> articles = snapshot.data;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index)=> Card(
                  child: niceList(articles[index], context),
                ),
              );
            }
             
            return Center (
              child: CircularProgressIndicator(),
            ); 
          }
        ),
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