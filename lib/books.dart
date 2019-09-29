//********************************************
//This class holds all the Books Page widgets
//********************************************

import 'package:flutter/material.dart';

import './user_select.dart';

class NewBookCard extends StatefulWidget {
  final List<String> bookEntries;

  NewBookCard(this.bookEntries);

  @override
  _NewBookCardState createState() => _NewBookCardState();
}

class _NewBookCardState extends State<NewBookCard> {
  Widget makeListTile(String desc) {
    int index = desc.lastIndexOf('~~~~~');
    //Need to add author and pages to this in future for dynamic updates on book
    return Container(
      height: 100.0,
      child: ListTile(
        onTap: () {
          //This is where we go to a new page of the book description
        },
        onLongPress: () {
          //This is where we can rearrange if possible
        },
        leading: Image(image: AssetImage('assets/pictures/rainbowfish.jpg'), height: 70,),
        isThreeLine: true,
        title: Text(
          desc.substring(0, index),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          desc.substring(index + 5),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),
        trailing: FavoriteWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: widget.bookEntries
            .map((title) => Card(
                  child: Column(
                    children: <Widget>[makeListTile(title)],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class BooksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookManager();
}

class _BookManager extends State<BooksPage> {
  List<String> _newBookEntry = [];
  //int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          UserDrawer(),
          NewBookCard(_newBookEntry),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var temp = await _navigateAndDisplaySelection(context);
          print(temp);
          _newBookEntry.add(temp);
        },
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
        ),
      ),
    );
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
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: _toggleFavorite,
            tooltip: "Favorite",
          ),
        ),
      ],
    );
  }
}  
