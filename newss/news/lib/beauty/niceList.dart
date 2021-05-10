import 'package:flutter/material.dart';
import 'package:news/model/article.dart';

Widget niceList(Article article) {
  return Container (
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
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),

          ),
          child: Text(article.author)
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
  );
}