import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news/model/news.model.dart';

Future<List<News>> fetchAllNews() async{
  final response = await http.get("http://newsapi.org/v2/top-headlines?country=id&apiKey=f41ef0c64ad44f8f8093dfdeb3c34400");
  if(response.statusCode == 200){
    final parsed = jsonDecode(response.body);

    return parsed['articles'].map<News>((json) => News.fromJson(json)).toList();
  }else{
    throw Exception('Failed to load');
  }

}