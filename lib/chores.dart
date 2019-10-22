//********************************************
//This class holds all the Chores Page widgets
//********************************************

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './user_select.dart';

List<String> _newChoreEntry = [];

class NewChoreCard extends StatefulWidget {
  final List<String> ChoreEntries;

  NewChoreCard(this.ChoreEntries);

  @override
  _NewChoreCardState createState() => _NewChoreCardState();
}

class _NewChoreCardState extends State<NewChoreCard> {
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Slidable makeListTile(String desc) {
    int index = desc.lastIndexOf('~~~~~');
    //Need to add author and pages to this in future for dynamic updates on Chore
    return Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: new Text('fish'),
            foregroundColor: Colors.white,
          ),
          title: new Text(desc.substring(0, index)),
          subtitle: new Text(desc.substring(index + 5)),
        ),
      ),
      actions: <Widget>[
        new IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(context, 'Deleted'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: widget.ChoreEntries.map((title) => Card(
              child: Column(
                children: <Slidable>[makeListTile(title)],
              ),
            )).toList(),
      ),
    );
  }
}

class ChoresPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChoreManager();
}

class _ChoreManager extends State<ChoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chores'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          UserDrawer(),
          NewChoreCard(_newChoreEntry),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var temp = await _navigateAndDisplaySelection(context);
          print(temp);
          _newChoreEntry.add(temp);
        },
        backgroundColor: Colors.black87,
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
        title: Text('Entry'),
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
