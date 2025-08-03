import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/news_model.dart';

class ApiService{

 final all_news_url = "https://newsapi.org/v2/everything?q=*&apiKey=a31fdf8215c94793841d82d5a7e7425f";

 final breaking_news_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=a31fdf8215c94793841d82d5a7e7425f";


//get all news
 Future<List<NewsModel>> getAllNews() async {
   try {
     Response response = await get(Uri.parse(all_news_url));

     if(response.statusCode ==200){
       Map<String,dynamic> json = jsonDecode(response.body);
       List<dynamic> body = json['articles'];
       List<NewsModel>articleList = body.map((item) => NewsModel.fromJson(item)).toList();
       return articleList;
     }else{
       throw ("No news found");
     }


   } catch (e) {
     rethrow;
   }
 }


 //get breaking news
 Future<List<NewsModel>> getBreakingNews() async {
   try {
     Response response = await get(Uri.parse(breaking_news_url));

     if(response.statusCode ==200){
       Map<String,dynamic> json = jsonDecode(response.body);
       List<dynamic> body = json['articles'];
       List<NewsModel>articleList = body.map((item) => NewsModel.fromJson(item)).toList();
       return articleList;
     }else{
       throw ("No news found");
     }

   } catch (e) {

    // print(e.toString());
     rethrow;
   }
 }


}