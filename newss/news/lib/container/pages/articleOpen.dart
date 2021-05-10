// open article 

import 'package:flutter/material.dart';


// import 'package:news/model/article.dart';

import 'package:webview_flutter/webview_flutter.dart';

// class ArticleOpen extends StatefulWidget {
  

//   @override
//   _ArticleOpenState createState() => _ArticleOpenState();
// }

// class _ArticleOpenState extends State<ArticleOpen> {
//   Article open = Article();
//   @override
//   Widget build(BuildContext context) {
//     return 
//       WebView(
//         initialUrl: "www.anirudhrath.tech",
//       );
//       // child: Text("hehe")
//   }
// }

Widget openArticle(String url, BuildContext context) {
  return WebView(
    initialUrl: url,
  );
}

// class OpenArticle extends StatefulWidget {
//   var url;
//   @override
//   _OpenArticleState createState() => _OpenArticleState();
// }

// class _OpenArticleState extends State<OpenArticle>  {
//   @override
  
//   Widget build(BuildContext context) {
//     return WebView(
//       javascriptMode: JavascriptMode.unrestricted,
//       initialUrl: 'https://www.anirudhrath.tech',
//     );
//   }
// }