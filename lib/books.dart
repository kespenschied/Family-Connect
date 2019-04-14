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
        leading: Image(image: AssetImage('assets/rainbowfish.jpg'), height: 64,),
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
          'By: ' + 'Marcus Pfister\n' + '20/40 pages read',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),
        trailing: IconButton(onPressed: (){},
          icon: Icon(Icons.favorite),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: 
          bookEntries
          .map(
            (title) => Card(
              child: Column(
                children: <Widget>[
                  makeListTile(title)
                ],
              ),
            )
          )
          .toList(),
       
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
}