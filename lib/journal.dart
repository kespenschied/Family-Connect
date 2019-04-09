//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Jpurnal Page widgets
//**********************************************

import 'package:flutter/material.dart';

import './drawer.dart';

//call NewJournalCard(List) in _CardManagerState
//call JournalCardManager() in JournalPage
//only NewJournalCard will have parameters

//||||||||||||||||||||||||||||||||||||||||||||||||||||||
class NewJournalCard extends StatelessWidget {
  final List<String> journalEntries;

  NewJournalCard(this.journalEntries);

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
              'Afterwards one of the kids said he was ' +
              'hungry for ice cream........',
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
          .map(
            (element) => Card(
                  child: Column(
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
            _newJournalEntry.add('Title: $_counter');
            _counter++;
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
