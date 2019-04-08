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
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
                      child: Image.asset('assets/harrypotter.jpg', height: 150, width: 75,),
                    ),
                    Padding(

                      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                      child: 
                      Text('Harry Potter and the\nSorceror\'s Stone\n\nPages read: 30/275', textScaleFactor: 1.5,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    //AssetImage('assets/harrypotter.jpg'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Image.asset('assets/caterpillar.jpg', height: 150, width: 75,),
                    ),
                    Padding(

                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: 
                      Text('The Very Hungry\nCaterpillar\n\nPages read: 30/30\nComplete!', textScaleFactor: 1.5,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    //AssetImage('assets/harrypotter.jpg'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Image.asset('assets/dogman.jpg', height: 150, width: 75,),
                    ),
                    Padding(

                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: 
                      Text('Dog Man: Brawl\nof the Wild\n\nPages read: 0/75', textScaleFactor: 1.5,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ],
            )
            
        ),
        // Column(
          // children: <Widget>[
            
          // ],
          
        // ),
        
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add book',
        child: Icon(Icons.add),
      ),
      
    );
  }
}