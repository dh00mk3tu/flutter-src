import 'package:flutter/material.dart';
import 'package:news/beauty/niceList.dart';
// import 'package:news/model/source.dart';
import 'package:news/pages/drawer.dart';
import 'package:news/services/api.dart';

import 'model/article.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              // return Center(
              //   child: Text("news t ime"),
              // );

              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index)=> Card(
                  child: niceList(articles[index]),
                
                ),


                  // Card(
                  //     child: Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 15.0
                  //       ),
                  //       Image.network(articles[index].urlToImage),
                  //       ListTile(
                  //         // shape:super ,
                  //         title: Text(articles[index].title,
                  //           style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //       // Padding(
                  //       //   padding: const EdgeInsets.all(15.0),
                  //       //   child: Text(articles[index].description,
                  //       //     style: TextStyle(
                  //       //       color:  Colors.black54,
                  //       //     ),
                  //       //   ),
                  //       // ),

                  //     ],
                  //   ),
                  // )
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