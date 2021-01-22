import 'package:flutter/material.dart';

Drawer sideDrawer(context){
  String name ="Rully saputra";
  return Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      UserAccountsDrawerHeader(
          accountName: Text(name),
          accountEmail: Text("rullysaputra.business@gmail.com"),
          decoration: BoxDecoration(
            color: Colors.lightBlue[700].withOpacity(0.7)
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor:  Colors.white,       
            /*Theme.of(context).platform == TargetPlatform.iOS
            ? Colors.blue
            : Colors.white,*/
            child: Text(
              '${name[0].toUpperCase()}',
              style: TextStyle(fontSize: 40.0),
            ),
          ),
      ),
      ListTile(
        leading: Icon(Icons.favorite,color: Colors.lightBlue[700].withOpacity(0.7)),
        title: Align(
          child: Text('Favorite'),
          alignment: Alignment(-1.2,0)
        ),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        leading: Icon(Icons.info_outline,color: Colors.lightBlue[700].withOpacity(0.7)),
        title: Align(
          child: Text('About'),
          alignment: Alignment(-1.2,0)
        ),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
);
}