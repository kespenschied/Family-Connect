//By: Kole Espenschied
//April 8th, 2019

//******************************************************
//This class holds all the Events/Calendar Page widgets
//******************************************************

import 'package:flutter/material.dart';
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
