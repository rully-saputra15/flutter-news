import 'dart:convert';
class News{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    author: json['author'].toString(),
    title: json['title'].toString(),
    description: json['description'].toString(),
    url: json['url'].toString(),
    urlToImage: json['urlToImage'].toString(),
    publishedAt: json['publishedAt'].toString(),
    content: json['content'].toString()
  );

  Map<String, dynamic> toJson() =>{
    "author": author,
    "title": title,
    "description" : description,
    "url" : url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "content": content
  };
}