

import 'package:flutter/material.dart';
import 'package:news/class/article.dart';
import 'package:news/container/pages/articleOpen.dart';
// import 'package:news/container/pages/technews.dart';

Widget niceList(Article article, BuildContext context) {
  final artURL = article.url;
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => openArticle(artURL, context))
        );
      },
      child: Container (
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
          ),
        ]
      ),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            // width: double.infinity,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(10),

            )
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),

            ),
            child: Column(
              children: [
                Text(article.author),
                // Text(" - "),
                // Text(article.source.name)
                // Text(article.content)
              ],
            )
          ),
          SizedBox(
            height: 10
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:15
            ),
          )
        ],
      )
    ),
  );
}