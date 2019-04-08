import 'package:flutter/material.dart';



class MyBooks extends StatefulWidget {
  const MyBooks({ Key key }) : super(key: key);

  @override
  _MyBooksState createState() => _MyBooksState();
}
class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
      ),
      endDrawer: Drawer(
        child: 
          ListView(
            children: <Widget>[
              //Not filled out because making home page. Koles looks really good though
            ],
          ),
      ),
    );
  }
}