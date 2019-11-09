//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Journal Page widgets
//**********************************************

import 'package:flutter/material.dart';
import './account.dart';
//import './entry.dart';

//This class builds the cards for the page
class NewJournalCard extends StatefulWidget {
  final List<String> journalEntries;
  NewJournalCard(this.journalEntries);

  @override
  _NewJournalCardState createState() => _NewJournalCardState();
}

class _NewJournalCardState extends State<NewJournalCard> {
  Widget makeListTile(String desc, double width, String title) {
    int index = 0;
    index = desc.lastIndexOf('~~~~~');
    return Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          Container(
            width: width / 4,
            color: Colors.blue,
            child: Center(
              child: CircleAvatar(
                minRadius: 10.0,
                backgroundColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/pictures/connie.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: width * 3 / 4.11,
            height: 100.0,
            color: Colors.blue,
            child: Card(
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  desc.substring(0, index),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                subtitle: Text(
                  desc.substring(index + 5),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String test = "tes~t";

    return Center(
        child: Column(
      children: widget.journalEntries
          .map(
            //this here is explained in Sean's tutorial video around the 1:50:00 mark of the youtube video
            (element) => Card(
              //basiclly, 'element' is a String in the JournalEntries list (which was passed from JournalPage below)
              child: Column(
                //it then creates a card.
                children: <Widget>[
                  makeListTile(element, width - .5, test),
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
  List<String> _newJournalEntry = [];
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
      body: ListView(
        children: <Widget>[
          NewJournalCard(_newJournalEntry),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var temp = await _navigateAndDisplaySelection(context);
          print(temp);
          //makeListTile(temp, MediaQuery.of(context).size.width, temp);
          if(temp != null){
            _newJournalEntry.add(temp); //add a new string to the List
          }
          /*setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EntryPage()),
            );
            _newJournalEntry
                .add('Title: $_counter'); //add a new string to the List
            _counter++; //increment counter
          });*/
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

// A method that launches the SelectionScreen and awaits the result from
// Navigator.pop.
_navigateAndDisplaySelection(BuildContext context) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionScreen()),
  );
  //print(Text("$result"));
  return result;
  // After the Selection Screen returns a result, hide any previous snackbars
  // and show the new result.
  //Scaffold.of(context)
  //..removeCurrentSnackBar()
  //..showSnackBar(SnackBar(content: Text("$result")));
}

class SelectionScreen extends StatefulWidget {
  //TextEditingController _textInputController = TextEditingController();

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  String title = "tempTitle", description = "tempdesc";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //Consistency of theme
        title: Text('Entry'),
        backgroundColor: Colors.black, //Ditto ^
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (text) {
                  title = text;
                },
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter the Title here'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (text) {
                  description = text;
                },
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter the Description here'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, title + "~~~~~" + description);
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
