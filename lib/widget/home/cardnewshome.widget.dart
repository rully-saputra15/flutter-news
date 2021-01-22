import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:news/model/news.model.dart';
class CardNewsHome extends StatelessWidget{
  final News news;
  final Function onPress;
  const CardNewsHome({
    Key key,
    @required this.news,
    @required this.onPress
  }) : super(key : key);

  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              blurRadius: 8,
              offset: Offset(0,1),
              spreadRadius: 2.0,
            )
          ]
        ),
        child: Stack(
          children: <Widget>[
            ImageCard(
              imageSource: news.urlToImage,
            ),
            ContentCard(
                title: news.title,
                author: news.author,
                description: news.description
            )

          ],
        ),
      )
    );
  }
}

class ContentCard extends StatelessWidget{
  final String title,author,description;
  const ContentCard({
    Key key,
    @required this.title,
    @required this.author,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.8,
      height: 100,
      margin: EdgeInsets.only(left: 110, top: 10),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.035,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 13,
                color: Colors.green,
              ),
              SizedBox(width: 5),
              Text(
                this.author,
                style: TextStyle(
                  fontSize:  size.width * 0.025,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
          Text(
            this.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: size.width * 0.03,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          )
        ],
        )
    );
  }
}

class ImageCard extends StatelessWidget{
  final String imageSource;
  const ImageCard({
    Key key,
    @required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )
      ),
      child: Image.network(
        this.imageSource,
        fit: BoxFit.cover
      ),
    );
  }
}