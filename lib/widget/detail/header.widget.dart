import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget{
  final String image;
  //final bool isLike;
  final Function onBackPress;
  //final Function onLikePress;

  const HeaderDetail({
    Key key,
    @required this.image,
    //this.isLike = false,
    @required this.onBackPress,
    //@required this.onLikePress
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 2,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipPath(
            clipper: RoundedClipper(),
            child: Image.network(
              this.image,
              fit: BoxFit.cover
            )
          ),
          Positioned(
            top: 25,
            left: 3,
            child: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle
              ),
              child: FlatButton(
                splashColor: Colors.black.withOpacity(0.9),
                padding: EdgeInsets.all(10),
                onPressed: this.onBackPress,
                child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)
              )
            )
          ),
          /*Positioned(
            bottom: 12,
            right: 25,
            child: Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(1,5),
                    spreadRadius: 5.0,
                  )
                ]
              ),
            )
          )*/
        ],
      )
    );
  }
}
class RoundedClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = new Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 1.5,size.height ,size.width,size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(oldClipper){
    return false;
  }
}