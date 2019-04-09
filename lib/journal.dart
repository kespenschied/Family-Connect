//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Jpurnal Page widgets
//**********************************************

import 'package:flutter/material.dart';

import './drawer.dart';

class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Journal'),
          backgroundColor: Colors.black,
        ),
        endDrawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            JournalCardManager('First Journal Entry'),
          ],
        ));
  }
}

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
        leading: Icon(
          Icons.cake,
          size: 60.0,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Journal Body',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        trailing: Icon(
            Icons.arrow_drop_down_circle,
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
//||||||||||||||||||||||||||||||||||||||||||||||||||||||

//****************************************************************
//****************************************************************
class JournalCardManager extends StatefulWidget {
  final String startingJournal;

  JournalCardManager(this.startingJournal);

  @override
  State<StatefulWidget> createState() => _CardManagerState();
}

class _CardManagerState extends State<JournalCardManager> {
  List<String> _newJournalEntry = [];  
  int _counter = 1;

  @override
  void initState() {
    _newJournalEntry.add(widget.startingJournal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FloatingActionButton(
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
          NewJournalCard(_newJournalEntry),
        ],
      ),
    );
  }
}
//****************************************************************
//****************************************************************
