import 'dart:convert';

import 'package:daily_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<Articlemodel> news = [];

  Future<void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=b37c7b7481e8452b90e5543dff5417b8";


    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if(jsondata['status'] == 'ok'){
      jsondata['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          Articlemodel articlemodel = Articlemodel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['content']
          );
          news.add(articlemodel);
        }
      });
    }
  }
}


class CategoryNews{
  List<Articlemodel> newss = [];

  Future<void> getcategoryNews(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=b37c7b7481e8452b90e5543dff5417b8";


    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if(jsondata['status'] == 'ok'){
      jsondata['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          Articlemodel articlemodel = Articlemodel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urltoimage: element['urlToImage'],
              content: element['content']
          );
          newss.add(articlemodel);
        }
      });
    }
  }
}

