//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Home/Landing widgets
//**********************************************

import 'package:flutter/material.dart';

import './achievements.dart';
import './books.dart';
import './chores.dart';
import './events.dart';
import './extracurriculars.dart';
import './homework.dart';
import './journal.dart';
import './lists.dart';
import './drawer.dart';

//this Home Page class creates the scaffold and the appBar for this page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: Center(
        child: HomeController(),
      ),
    );
  }
}

//This class defines the layout for the Home Page widgets. It also
//sets sets a gesture listener to each Container as to go to the 
//correct page. Calls 'HomeIconInfo's constructor to build each 
//container on the screen.
class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/calendar.jpg', 'Events'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/journal.jpg', 'Journal'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JournalPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/books.jpg', 'Books'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BooksPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/chores.jpg', 'Chores'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoresPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/homework.jpg', 'Homework'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeworkPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/list.jpg', 'Lists'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListsPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/extra.jpg', 'Extracurriculars'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExtracurPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/achievements.jpg', 'Achievements'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AchievementsPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//These Stateful Classes (could be stateless, was practicing stateful, plus it will
//probably have mutable data later when we implement functionality) set each Container/Image
//on the Homepage with the correct picture, Text, and page alignment. Is called in HomeController.
class HomeIconsInfo extends StatefulWidget {
  final String imagePath;
  final String title;

  HomeIconsInfo(this.imagePath, this.title);

  @override
  _HomeIconsInfoState createState() =>
      _HomeIconsInfoState(this.imagePath, this.title);
}

class _HomeIconsInfoState extends State<HomeIconsInfo> {
  String imagePath;
  String title;

  _HomeIconsInfoState(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double deviceWidth = width * 1.00;
    double deviceHeight = height * 0.2207;

    return Container(
      width: deviceWidth / 2,
      height: deviceHeight,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.grey,
          background: Paint()..color = Colors.black87,
        ),
      ),
    );
  }
}

