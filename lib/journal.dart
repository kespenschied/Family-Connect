//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Journal Page widgets
//**********************************************

import 'package:flutter/material.dart';

import './drawer.dart';


//This class builds the cards for the page
class NewJournalCard extends StatelessWidget {
  final List<String> journalEntries;

  NewJournalCard(this.journalEntries);

  //this function returns a Container widget, and takes a 'title'
  //string as a parameter. This comes from the class below in the
  //List<String> dataField.
  Widget makeListTile(String title) {
    return Container(
      height: 100.0,
      child: ListTile(
        isThreeLine: true,
        title: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          'Today the children and I went ' +
              'to the park and had a wonderful time. ' +
              'Afterwards one of the kids said.....',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),
        trailing: Icon(
          Icons.more_vert,
          size: 50.0,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: journalEntries
          .map( //this here is explained in Sean's tutorial video around the 1:50:00 mark of the youtube video
            (element) => Card( //basiclly, 'element' is a String in the JournalEntries list (which was passed from JournalPage below)
                  child: Column( //it then creates a card.
                    children: <Widget>[
                      makeListTile(element),
                    ],
                  ),
                ),
          )
          .toList(),
    ));
  }
}

//Main scaffold and Journal Page. _newJournalEntry is an array of Strings. This
//is passed to the parameterized class above, 'NewJournalCard'. This list is used
//in NewJournalCards build method, and the actual string is passed to NewJournalCards'
//makeListTile function to act as a 'title' for its String parameter. 
class JournalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JournalManager();
}

class _JournalManager extends State<JournalPage> {
  List<String> _newJournalEntry = ["Title: 1","Title: 2", "Title: 3"];
  int _counter = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Journal'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          NewJournalCard(_newJournalEntry),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _newJournalEntry.add('Title: $_counter'); //add a new string to the List
            _counter++; //increment counter
          });
        },
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}