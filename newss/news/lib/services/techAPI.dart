// fetch the cool news data hehe

import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/article.dart';

class TechApiGet {
  final url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3f4b7133c249437c971f0bac00a31ff3";

  Future <List<Article>> getTechArticle() async {
    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      Map<String, dynamic> json  = jsonDecode(res.body);
      List<dynamic>body = json['articles'];

      List <Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }
    else {
      throw("no api failed");
    }
  } 
}