//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Books Page widgets
//********************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class NewBookCard extends StatelessWidget{
  final List<String> bookEntries;

  NewBookCard(this.bookEntries);

  Widget makeListTile(String title){ //Need to add author and pages to this in future for dynamic updates on book
    return Container(
      height: 100.0,
      child: ListTile(
        onTap: (){
          //This is where we go to a new page of the book description
        },
        onLongPress: (){
          //This is where we can rearrange if possible
        },
        leading: Image(image: AssetImage('assets/rainbowfish.jpg'), height: 70,),
        isThreeLine: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          'By: ' + 'Marcus Pfister\n' + '15/30 pages read',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),
        trailing: FavoriteWidget(),
        
        //IconButton(
        //   onPressed: (){
        //     //We add functionality to make the icon change to red if possible.
        //     // setState(){
              
        //     // } 
        //   },
        //   icon: Icon(Icons.favorite),
        //   tooltip: "Favorite",
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: 
          bookEntries.map(
            (title) => Card(
              child: Column(
                children: <Widget>[
                  makeListTile(title)
                ],
              ),
            )
          ).toList(),
      ),
    );
  }

}
class BooksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookManager();
}

class _BookManager extends State<BooksPage>{
  List<String> _newBookEntry = ["The Rainbow Fish", "The Rainbow Fish", "The Rainbow Fish"];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          NewBookCard(_newBookEntry),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.orange,), title: Text('Josh', style: TextStyle(fontSize: 20.0),),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.pink[200],), title: Text('Katie', style: TextStyle(fontSize: 20.0),),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.green,), title: Text('David', style: TextStyle(fontSize: 20.0),),),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //This section needs to be set in the future to be taken to a new page in order to enter details
            //about the book that's being added as well as scanning ISBN possibly. This is fine for HI FI
            _newBookEntry.add("The Rainbow Fish");
          });
        },
        backgroundColor: Colors.black87,
        child: Icon(Icons.add,),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
     _selectedIndex = index; 
    });
  }
}
//Creation of new custom widget that has interaction and states
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}


class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

//For toggling the state of the widget
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _isFavorited = false;
    } else {
      _isFavorited = true;
    }
  });
}
//Build the custom favorite widget to be
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: _toggleFavorite,
            tooltip: "Favorite",
          ),
        ),
      ],
    );
  }
}  