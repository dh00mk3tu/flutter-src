// article model class 

import 'package:news/class/source.dart';

class Article{
  Source source;
  String author;
  String title;
  String url;
  String urlToImage;

  Article({
    this.url,
    this.urlToImage,
    this.source,
    this.author,
    this.title,
  });
  // void MapFunction() {
  //   source = Source.fromJson(json['source']);
  //   author = json['author'] as String;
  // }

  
  // Future <Article> article {
  //   source : Source.fromJson(json['source']),
  // }

  factory Article.fromJson(Map <String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
    );
  }

}