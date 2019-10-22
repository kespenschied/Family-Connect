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

class _NewBookCardState extends State<NewBookCard> {
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Slidable makeListTile(String desc) {
    slideToDismissDelegate:
    new SlideToDismissDrawerDelegate(
      onWillDismiss: (actionType) {
        return showDialog<bool>(
          context: context,
          builder: (context) {
            return new AlertDialog(
              title: new Text('Delete'),
              content: new Text('Item will be deleted'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                new FlatButton(
                  child: new Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        );
      },
    );

    /*slideToDismissDelegate: new SlideToDismissDrawerDelegate(
      onDismissed: (actionType) {
        _showSnackBar(
            context,
            actionType == SlideActionType.primary
                ? 'Dismiss Archive'
                : 'Dimiss Delete');
        setState(() {
          items.removeAt(index);
        });
      },
    ),*/

    int index = desc.lastIndexOf('~~~~~');
    //Need to add author and pages to this in future for dynamic updates on book
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
          //onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
    /*return Container(  
      height: 100.0,
      child: ListTile(
        onTap: () {
          //This is where we go to a new page of the book description
        },
        onLongPress: () {
          //This is where we can rearrange if possible
        },
        leading: Image(
          image: AssetImage('assets/pictures/rainbowfish.jpg'),
          height: 70,
        ),
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
    );*/
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
