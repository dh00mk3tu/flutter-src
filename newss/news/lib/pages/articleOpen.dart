// open article 

import 'package:flutter/material.dart';


import 'package:news/model/article.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ArticleOpen extends StatefulWidget {
  

  @override
  _ArticleOpenState createState() => _ArticleOpenState();
}

class _ArticleOpenState extends State<ArticleOpen> {
  Article open = Article();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      WebView(
        initialUrl: "www.anirudhrath.tech",
      )
      // child: Text("hehe")
    );
  }
}