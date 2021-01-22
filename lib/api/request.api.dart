import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news/model/news.model.dart';

Future<List<News>> fetchAllNews() async{
  final request = await http.get("http://newsapi.org/v2/top-headlines?country=id&apiKey=f41ef0c64ad44f8f8093dfdeb3c34400");
  final parsed = jsonDecode(request.body);

  return parsed['articles'].map<News>((json) => News.fromJson(json)).toList();
}