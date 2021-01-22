import 'package:flutter/material.dart';
import 'package:news/model/news.model.dart';
import 'package:news/widget/detail/header.widget.dart';
class DetailScreen extends StatefulWidget{
  final News news;
  DetailScreen({
    Key key,
    @required this.news
  }) : super(key: key);
  _DetailScreenState createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen>{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderDetail(
                image: widget.news.urlToImage ?? "assets/images/detail.png",
                onBackPress: (){
                  Navigator.pop(context);
                },
              ),
              ContentDetail(
                content: widget.news.content,
                author: widget.news.author,
                title: widget.news.title
              )
            ]
          )
        )
      )
    );
  }
}

class ContentDetail extends StatelessWidget{
  final String title, author, content;

  const ContentDetail({
    Key key,
    @required this.title,
    @required this.author,
    @required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                    Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: Colors.green
                ),
                SizedBox(width: 5),
                Text(
                  this.author,
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.black.withOpacity(0.5)
                  )
                )
              ],
            )
          ),
          SizedBox(height: 25),
          Text(
            this.content,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.black.withOpacity(0.6),
              height: 1.3,
            )
          ),
          SizedBox(height: 25),
        ],
      )
    );
  }
}