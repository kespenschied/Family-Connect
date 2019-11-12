//By: Kole Espenschied
//April 8th, 2019

//******************************************************
//This class holds all the Events/Calendar Page widgets
//******************************************************

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'global_contants.dart';

import 'calendar.dart';
import 'coreClasses/EventModel.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();
}
class CalendarState extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  DateTime _dateTime;
  QuerySnapshot _userEventSnapshot;
  int _beginMonthPadding=0;

  CalendarState() {
    _dateTime = DateTime.now();
    setMonthPadding();
  }

  @override
  void initState() {
    super.initState();

    /*_firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("******** - onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("******** - onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("******** - onResume: $message");
      },
    ); */

    /* _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) async {
      assert(token != null);
      print('push token: ' + token);

      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      QuerySnapshot snapshot = await Firestore.instance.collection('users')
          .where('email', isEqualTo: user.email).getDocuments();

      snapshot.documents.forEach((doc) {
        Firestore.instance.collection('users').document(doc.documentID)
          .setData({'email': user.email, 'token': token});
      });
    });
  } */

  void setMonthPadding() {
    _beginMonthPadding = new DateTime(_dateTime.year, _dateTime.month, 1).weekday;
    _beginMonthPadding == 7 ? (_beginMonthPadding = 0) : _beginMonthPadding;
  }

  Future<QuerySnapshot> _getCalendarData() async {
    FirebaseUser currentUser = await _auth.currentUser();

    if (currentUser != null) {
      QuerySnapshot userEvents = await Firestore.instance
          .collection('calendar_events')
          .where(
          'time', isGreaterThanOrEqualTo: new DateTime(_dateTime.year, _dateTime.month))
          .where('email', isEqualTo: currentUser.email)
          .getDocuments();

      _userEventSnapshot = userEvents;
      return _userEventSnapshot;
    } else {
      return null;
    }
  }

  void _goToToday() {
    print("trying to go to the month of today");
    setState(() {
      _dateTime = DateTime.now();

      setMonthPadding();
    });
  }

  void _previousMonthSelected() {
    setState(() {
      if (_dateTime.month == DateTime.january)
        _dateTime = new DateTime(_dateTime.year - 1, DateTime.december);
      else
        _dateTime = new DateTime(_dateTime.year, _dateTime.month - 1);

      setMonthPadding();
    });
  }

  void _nextMonthSelected() {
    setState(() {
      if (_dateTime.month == DateTime.december)
        _dateTime = new DateTime(_dateTime.year + 1, DateTime.january);
      else
        _dateTime = new DateTime(_dateTime.year, _dateTime.month + 1);

      setMonthPadding();
    });
  }

  void _onDayTapped(int day) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
      => new EventsView(new DateTime(_dateTime.year, _dateTime.month, day)))
    );
  }

  void _onFabClicked() {
    Navigator.pushNamed(context, Constants.eventCreatorRoute);
  }

  @override
  Widget build(BuildContext context) {
    final int numWeekDays = 7;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    /*28 is for weekday labels of the row*/
    // 55 is for iPhoneX clipping issue.
    final double itemHeight = (size.height - kToolbarHeight-kBottomNavigationBarHeight-24-28-55) / 6;
    final double itemWidth = size.width / numWeekDays;

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new FittedBox(
                fit: BoxFit.contain,
                child: new Text(
                    getMonthName(_dateTime.month) + " " + _dateTime.year.toString(),
                  )
              ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.today,
                  color: Colors.white,
                ),
              onPressed: _goToToday
            ),
            IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onPressed: _previousMonthSelected
            ),
            IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: _nextMonthSelected
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _onFabClicked,
          child: new Icon(Icons.add),
        ),
        body:
        new FutureBuilder(
            future: _getCalendarData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return new LinearProgressIndicator();
                case ConnectionState.done:
                  return new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: new Text('S',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('M',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('T',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('W',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('T',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('F',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                          new Expanded(
                              child: new Text('S',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline)),
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      new GridView.count(
                        crossAxisCount: numWeekDays,
                        childAspectRatio: (itemWidth / itemHeight),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                            getNumberOfDaysInMonth(_dateTime.month),
                                (index) {
                              int dayNumber = index + 1;
                              return new GestureDetector(
                                // Used for handling tap on each day view
                                  onTap: () =>
                                      _onDayTapped(
                                          dayNumber - _beginMonthPadding),
                                  child: new Container(
                                      margin: const EdgeInsets.all(2.0),
                                      padding: const EdgeInsets.all(1.0),
                                      decoration: new BoxDecoration(
                                          border: new Border.all(
                                              color: Colors.grey)),
                                      child: new Column(
                                        children: <Widget>[
                                          buildDayNumberWidget(dayNumber),
                                          buildDayEventInfoWidget(dayNumber)
                                        ],
                                      )));
                            }),
                      )
                    ],
                  );
                  break;
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return new Text('Result: ${snapshot.data}');
              }
            }
        )
    );
  }

  Align buildDayNumberWidget(int dayNumber) {
    //print('buildDayNumberWidget, dayNumber: $dayNumber');
    if ((dayNumber-_beginMonthPadding) == DateTime.now().day
        && _dateTime.month == DateTime.now().month
        && _dateTime.year == DateTime.now().year) {
      // Add a circle around the current day
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 35.0, // Should probably calculate these values
          height: 35.0,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
            border: Border.all(),
          ),
          child: new Text(
            (dayNumber - _beginMonthPadding).toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      );
    } else {
      // No circle around the current day
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 35.0, // Should probably calculate these values
          height: 35.0,
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Text(
            dayNumber <= _beginMonthPadding ? ' ' : (dayNumber - _beginMonthPadding).toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      );
    }
  }

  Widget buildDayEventInfoWidget(int dayNumber) {
    int eventCount = 0;
    DateTime eventDate;

    _userEventSnapshot.documents.forEach((doc) {
      eventDate = doc.data['time'];
      if (eventDate != null
          && eventDate.day == dayNumber - _beginMonthPadding
          && eventDate.month == _dateTime.month
          && eventDate.year == _dateTime.year) {
        eventCount++;
      }
    });

    if (eventCount > 0) {
        return new Expanded(
          child:
          FittedBox(
            alignment: Alignment.topLeft,
            fit: BoxFit.contain,
            child: new Text(
              "Events:$eventCount",
              maxLines: 1,
              style: new TextStyle(fontWeight: FontWeight.normal,
                  background: Paint()..color = Colors.amberAccent),
            ),
          ),
        );
    } else {
      return new Container();
    }
  }

  int getNumberOfDaysInMonth(final int month) {
    int numDays = 28;

    // Months are 1, ..., 12
    switch (month) {
      case 1:
        numDays = 31;
        break;
      case 2:
        numDays = 28;
        break;
      case 3:
        numDays = 31;
        break;
      case 4:
        numDays = 30;
        break;
      case 5:
        numDays = 31;
        break;
      case 6:
        numDays = 30;
        break;
      case 7:
        numDays = 31;
        break;
      case 8:
        numDays = 31;
        break;
      case 9:
        numDays = 30;
        break;
      case 10:
        numDays = 31;
        break;
      case 11:
        numDays = 30;
        break;
      case 12:
        numDays = 31;
        break;
      default:
        numDays = 28;
    }
    return numDays + _beginMonthPadding;
  }

  String getMonthName(final int month) {
    // Months are 1, ..., 12
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown";
    }
  }












//for help refer to https://pub.dev/packages/flutter_calendar_carousel
/* import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<EventsPage> {
  static String noEventText = "NO EVENTS";
  String calendarText = noEventText;
  DateTime _currentDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar/Events'),
        backgroundColor: Colors.black,
      ),
      body: _showCalendar(),
      floatingActionButton: addEvent(),
      backgroundColor: Colors.grey,
    );
  }

  SingleChildScrollView _showCalendar() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            child: CalendarCarousel(
              onDayPressed: (DateTime date, List<Event> events) {
                setState(() {
                  _currentDate = date;
                  refresh(date);
                });
              },
              daysTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              weekdayTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              headerTextStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              todayBorderColor: Colors.black,
              selectedDayButtonColor: Colors.green,
              selectedDayBorderColor: Colors.black,
              thisMonthDayBorderColor: Colors.black87,
              weekFormat: false,
              markedDatesMap: _markedDateMap,
              height: 420.0,
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: false,
            ),
          ),
          _newEvent(calendarText),
        ],
      ),
    );
  }

  EventList<Event> _markedDateMap = new EventList<Event>(events: {
    new DateTime(2019, 4, 14): [
      new Event(
        date: new DateTime(2019, 1, 14),
        title: 'Sleepover',
        icon: Icon(Icons.access_alarm),
      ),
    ]
  });

  void refresh(DateTime date) {
    if (_markedDateMap
        .getEvents(new DateTime(date.year, date.month, date.day))
        .isNotEmpty) {
      calendarText = _markedDateMap
          .getEvents(new DateTime(date.year, date.month, date.day))[0]
          .title;
    } else {
      calendarText = noEventText;
    }
  }

  Card _newEvent(String title) {
    if (title == noEventText) {
      return Card(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Card(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                    child: Text(
                      'David Staying at Rogers House',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 15.0,
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      child: Text(
                        '9:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  //******************************************************************************************** */
  // Nothing needs to change but this functions 'onPressed' command. It needs to be changed to allow
  //the user to type in a new event and add a timestamp/alert for it. As of now it just adds one event
  //to the calendar and creates a single card at the bottom of the calendar describing the event
  //******************************************************************************************** */
  FloatingActionButton addEvent() {
    return FloatingActionButton(
      backgroundColor: Colors.black87,
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        if (_currentDate != null) {
          setState(() {
            _markedDateMap.add(
                _currentDate,
                new Event(
                  date: _currentDate,
                  title: 'Sleepover',
                ));
            refresh(_currentDate);
          });
        }
      },
    );
  }
 } 