import 'package:flutter/material.dart';
import 'package:news/api/request.api.dart';
import 'package:news/model/news.model.dart';
import 'package:news/widget/home/newslist.widget.dart';
import 'package:news/widget/home/sidedrawer.widget.dart';
class HomePage extends StatefulWidget{
  const HomePage({
    Key key
  }) : super(key: key);
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  Future<List<News>> news;
  bool isSearch = false;
  String searchValue = '';
  void getAllNews() async{
    news = fetchAllNews();
    print(news);
  }
  @override
  void initState(){
    super.initState();
    getAllNews();
  }
  void clickSearch(){
    setState(() {
      isSearch = !this.isSearch;
    });
  }
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(size),
      drawer: sideDrawer(context),
      body: FutureBuilder<List<News>>(
          future: news,
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<News> data = snapshot.data ?? [];
              return Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: <Widget>[
                    NewsList(listNews: data,)
                  ],
                )
              );
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
    );
  }
  AppBar buildAppBar(Size size){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
        
      ),
      side: BorderSide(
        color: Colors.black.withOpacity(0.4),
        width: 0.3
      )
      ),
      leading: Builder(
        builder: (context) =>IconButton(
        highlightColor: Colors.green.withOpacity(0.2),
        icon: Icon(
          Icons.menu,
          color: Colors.black.withOpacity(0.6),
        ),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },
      ),
      ),
      title: Container(
        child: this.isSearch
          ? TextField(
            onChanged: (value){
              setState(() {
                
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Cari Berita?"
            ),
          ) : Align(
            child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,height: size.height * 0.090),
            alignment: Alignment(-1.4,0),
          )
      ),
      //centerTitle: true,
      actions: <Widget>[
        IconButton(
          alignment: Alignment.center,
          highlightColor: Colors.green.withOpacity(0.2),
          onPressed: this.clickSearch,
          icon: Icon(
            this.isSearch ? Icons.close : Icons.search,
            color: Colors.black
          )
        )
      ]
    );
  }
}