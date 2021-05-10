import 'package:flutter/material.dart';
import 'package:news/style/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/container/pages/drawer.dart';
// import 'package:news/services/api.dart';

import 'package:news/class/article.dart';
import 'package:news/container/api/bitcoinAPI.dart';
// import 'package:news/services/techAPI.dart';

import 'package:news/main.dart';


void main() {
  runApp(BitcoinPageApp());
}

class BitcoinPageApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BitcoinPage(),
    );
  }
}

class BitcoinPage extends StatefulWidget {
  @override
  _BitcoinPageState createState() => _BitcoinPageState();
}


class _BitcoinPageState extends State<BitcoinPage> {

  BitcoinApiGet hehe = BitcoinApiGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "completely accurate bitcoin news",
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
        future: hehe.getBitcoinArticle(),
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