import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:faker/faker.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  //******************************************************************* */
  //      This list will be populated by database data eventually
  //******************************************************************* */
  final _listOfNotifications =
      List<String>.generate(20, (i) => "Notification ${i + 1}");

  final List _colorsForAvatars = [
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.brown,
    Colors.green,
    Colors.orange,
    Colors.purple
  ];
  var faker =
      new Faker(); //used to generate random data, check out https://pub.dev/packages/faker#-readme-tab-

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        // Add box decoration
        decoration: _backgroundStyling(),
        child: _buildNotifications(context),
      ),
      bottomNavigationBar: _clearAllButton(context),        
    );
  }
  ///////////////////////////////////////////
  ////////all functions after this//////////
  //////////////////////////////////////////

  BoxDecoration _backgroundStyling() {
    return BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.grey[400],
          Colors.grey[600],
          Colors.grey[500],
          Colors.grey[400],
        ],
      ),
    );
  }

  Widget _buildNotifications(BuildContext context) {
    if (_listOfNotifications.isEmpty) {
      return Container(
          height: MediaQuery.of(context).size.height,
          child: ListTile(
            title: AutoSizeText(
              'No Notifications',
              textAlign: TextAlign.center,
              wrapWords: true,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
    }
    return ListView.builder(
      itemCount: _listOfNotifications.length,
      itemBuilder: (context, index) {
        final _singleNotification = _listOfNotifications[index];
        return Dismissible(
          // Specify the direction to swipe and delete
          direction: DismissDirection.horizontal,
          key: Key(_singleNotification),
          onDismissed: (direction) {
            // Removes that item the list on swipwe
            setState(() {
              _listOfNotifications.removeAt(index);
            });
          },
          background: Container(
            margin: EdgeInsets.all(3.0),
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.delete,
                  size: 45.0,
                ),
                Icon(
                  Icons.delete,
                  size: 45.0,
                ),
              ],
            ),
          ),
          child: _notificationDesign('$_singleNotification'),
        );
      },
    );
  }

  Container _notificationDesign(title) {
    var _amOrPm = (randomBetween(1, 2) % 2 == 0) ? 'am' : 'pm';
    var _randomTimeStamp =
        '${randomBetween(1, 12)}:${randomBetween(0, 5)}${randomBetween(0, 9)}$_amOrPm'; //randomly generate a timestamp
    var _randomDate =
        '${randomBetween(1, 12)}/${randomBetween(1, 28)}/19'; //randomly generate a date

    return Container(
      margin: EdgeInsets.all(3.0),
      color: Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        subtitle: AutoSizeText(
          faker.lorem.sentence(), //generate random sentence in latin, fake
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          minFontSize: 15.0,
          maxLines: 2,
          overflow:
              TextOverflow.ellipsis, //will cut off overflow text with '....'
        ),
        leading: CircleAvatar(
          backgroundColor: _colorsForAvatars[randomBetween(0, 6)],
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              randomAlpha(2).toUpperCase(), //randomly generate 2 letters
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(_randomTimeStamp),
            Text(_randomDate),
          ],
        ),
      ),
    );
  }

  Widget _clearAllButton(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: 200.0,
        child: RaisedButton(
          onPressed: () {
            _clearAllConfirmation(context);
          },
          elevation: 5.0,
          color: Colors.red,
          textColor: Colors.white,
          child: Text(
            'Clear All',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  void _clearAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Clear All Notifications?",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          actions: <Widget>[
            ButtonTheme(
              minWidth: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    //after the database is done, we wont clear the list, we'll clear that user's database of notifications
                    _listOfNotifications.clear();
                  });
                },
                elevation: 5.0,
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 5.0,
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
