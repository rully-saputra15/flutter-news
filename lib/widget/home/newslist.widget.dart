import 'package:flutter/material.dart';
import 'package:news/model/news.model.dart';
import 'package:news/widget/home/cardnewshome.widget.dart';
import 'package:news/screen/detail.screen.dart';
class NewsList extends StatefulWidget{
  final List<News> listNews;

  const NewsList({
    Key key,
    @required this.listNews
  }) : super(key: key);
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.listNews.length,
              itemBuilder: (context,index) => buildCardNews(index),
            )
          )
        ],
      )
    );
  }
  Widget buildCardNews(int index){
      return CardNewsHome(
    news: widget.listNews[index],

    onPress: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
           return DetailScreen(news: widget.listNews[index]);
          }
        )
      );
    }
  );
  }
}