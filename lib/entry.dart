import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:faker/faker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: EntryPage(),
  ));
}

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Add a journal entry'),
    );
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

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
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
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, title + " : " + description);
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
