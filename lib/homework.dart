//By: Kole Espenschied
//April 8th, 2019

//***********************************************
//This class holds all the Homework Page widgets
//***********************************************

import 'package:flutter/material.dart';
import './drawer.dart';

class HomeworkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeworkState();
}

class _HomeworkState extends State<HomeworkPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        backgroundColor: Colors.black,
      ),
      body: drawBody(width),
      backgroundColor: Colors.grey,
    );
  }

  Widget drawBody(double width) {
    List<Widget> homework1 = [rightCardTitleBar(width, Colors.green, 'David\'s Homework', Icons.create),
                              rightCardListItems(width, 'Math', 'Problems 1-10\nDue: 04/19', true),
                              rightCardListItems(width, 'History', 'Read Chapter 3\nDue: 04/20', false),
                              rightCardListItems(width, 'History', 'Do Ch. 3 Problems\nDue: 04/22', false),
                              rightCardListItems(width, 'English', 'Do Grammar Assignment\nDue: 04/23', true),
                              rightCardListItems(width, 'Art', 'Finish Poster\nDue: 04/23', true),];

    List<Widget> homework2 = [rightCardTitleBar(width, Colors.orange, 'Josh\'s Homework', Icons.create),
                              rightCardListItems(width, 'Calculus I', 'Ch 5-Problems 1-10\nDue: 04/19', false),
                              rightCardListItems(width, 'History', 'Read Chapter 5\nDue: 04/20', true),
                              rightCardListItems(width, 'History', 'Write Paper\nDue: 04/22', false),
                              rightCardListItems(width, 'Biology', 'Finish Lab Report\nDue: 04/23', true),
                              rightCardListItems(width, 'Speech', 'Finish Speech\nDue: 04/23', false),];

    List<Widget> homework3 = [rightCardTitleBar(width, Colors.pink[200], 'Katie\'s Homework', Icons.create),
                              rightCardListItems(width, 'Art', 'Finish Painting\nDue: 04/19', true),
                              rightCardListItems(width, 'History', 'Read Chapter 5\nDue: 04/20', true),
                              rightCardListItems(width, 'History', 'Write Paper\nDue: 04/22', true),
                              rightCardListItems(width, 'English', 'Read Chapter 7\nDue: 04/23', true),
                              rightCardListItems(width, 'Math', 'Long Division Problems 1-15\nDue: 04/23', true),];

    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    drawLeftCards(width, Colors.green, 'assets/youngboy.png',
                        'David', '4th Grade', '2.5 GPA'),
                    drawRightCards(width, homework1),
                  ],
                ),
                Row(
                  children: <Widget>[
                    drawLeftCards(width, Colors.orange, 'assets/collegekid.jpg',
                        'Josh', '12th Grade', '3.35 GPA'),
                    drawRightCards(width, homework2),
                  ],
                ),
                Row(
                  children: <Widget>[
                    drawLeftCards(width, Colors.pink[200],
                        'assets/daughter.jpg', 'Katie', '5th Grade', '4.0 GPA'),
                    drawRightCards(width, homework3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget drawLeftCards(double width, Color accountColor, String image,
      String account, String grade, String gpa) {
    double leftCardWidth = width / 3;

    return Container(
      width: leftCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(2.0, 2.0, 0, 5.0),
        color: accountColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: CircleAvatar(
                  maxRadius: 60.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  account,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Grade:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                grade,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                gpa,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawRightCards(double width, List<Widget> widgetList) {
    double rightCardWidth = width / 3 * 2;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      width: rightCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(0, 2.0, 2.0, 5.0),
        color: Colors.white70,
        child: ListView(children: widgetList),
      ),
    );
  }
}

Widget rightCardTitleBar(double rightCardWidth, Color accountColor,
    String title, IconData listIcon) {
  return Container(
    width: rightCardWidth,
    height: 55.0,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.black),
      ),
    ),
    child: Card(
      shape: BeveledRectangleBorder(),
      elevation: 5.0,
      color: accountColor,
      margin: EdgeInsets.all(0),
      child: ListTile(
        leading: Icon(
          listIcon,
          size: 30.0,
          color: Colors.black,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.more_vert,
          size: 30.0,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget rightCardListItems(
    double rightCardWidth, String listItem, String info, bool value) {
  return Card(
    elevation: 15.0,
    margin: EdgeInsets.all(1),
    child: CheckboxListTile(
      activeColor: Colors.green,
      isThreeLine: true,
      title: Text(
        listItem,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      subtitle: Text(
        info,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      value: value,
      onChanged: (bool val) {},
    ),
  );
}
