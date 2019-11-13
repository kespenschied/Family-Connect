//********************************************
//This class holds all the Books Page widgets
//********************************************

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './user_select.dart';

List<String> _newBookEntry = [];

class NewBookCard extends StatefulWidget {
  final List<String> bookEntries;

  NewBookCard(this.bookEntries);

  @override
  _NewBookCardState createState() => _NewBookCardState();
}

void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
}

class _NewBookCardState extends State<NewBookCard> {
  Slidable makeListTile(String desc) {
    int index = desc.lastIndexOf('~~~~~');
    return Slidable.builder(
      delegate: new SlidableDrawerDelegate(),
      slideToDismissDelegate: new SlideToDismissDrawerDelegate(
        onDismissed: (actionType) {
            _showSnackBar(context, desc.substring(0, index) + " has been deleted");
            widget.bookEntries.removeWhere((item) => desc.substring(0, index) == item.toString().substring(0, index) 
                                              && desc.substring(index + 5) == item.toString().substring(index + 5) );
        },
      ),

      key: Key(UniqueKey().toString()), 
      actionExtentRatio: 0.25,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          leading: new CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Image.asset('assets/pictures/connie.jpg'),
            foregroundColor: Colors.white,
          ),
          title: new Text(desc.substring(0, index)),
          subtitle: new Text(desc.substring(index + 5)),
        ),
      ),
      actionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Delete',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.red.withOpacity(animation.value)
                    : (renderingMode == SlidableRenderingMode.dismiss
                        ? Colors.red
                        : Colors.green),
                icon: Icons.archive,
                onTap: () async {
                  var state = Slidable.of(context);
                  var dismiss = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Book?'),
                        content: Text('Book will be deleted from the list.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      );
                    },
                  );

                  if (dismiss) {
                    state.dismiss();
                  }
                },
              );
            } 
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: widget.bookEntries
            .map((title) => Card(
                  child: Column(
                    children: <Slidable>[makeListTile(title)],
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
          //UserDrawer(),
          NewBookCard(_newBookEntry),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var temp = await _navigateAndDisplaySelection(context);
          if (temp.toString().contains("tempTitle") || temp.toString().contains("tempDesc")) {
              showDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('You must enter a title and a description'),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
              }); 
          }
          else {
            print(temp);
            _newBookEntry.add(temp);
          }
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
  return result;
}

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  String title = "tempTitle", description = "tempDesc";
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