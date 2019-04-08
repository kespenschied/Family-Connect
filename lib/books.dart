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
      body: 
        Container(
          child:
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //AssetImage('assets/harrypotter.jpg'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 50),
                      child: Text('Here is book entry 1', textScaleFactor: 1.5,),
                    ),
                    // Text('Here is book entry 1\n', textScaleFactor: 1.5,),
                    // Text('Book entry 2', textScaleFactor: 1.5,),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 50),
                      child: Text('Here is book entry 2', textScaleFactor: 1.5,),
                    ),
                    // Text('Here is book entry 1\n', textScaleFactor: 1.5,),
                    // Text('Book entry 2', textScaleFactor: 1.5,),
                  ],
                ),
              ],
            )
            
        )
        // Column(
          // children: <Widget>[
            
          // ],
          
        // ),
        
      
      
    );
  }
}