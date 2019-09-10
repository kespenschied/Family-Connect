//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Home/Landing widgets
//**********************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './achievements.dart';
import './books.dart';
import './chores.dart';
import './events.dart';
import './reports.dart';
import './homework.dart';
import './journal.dart';
import './lists.dart';
import './drawer.dart';

//this Home Page class creates the scaffold and the appBar for this page
class HomePage extends StatelessWidget {
const HomePage({
    Key key,
    @required this.user
  }) : super(key: key);

  final AuthResult user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(user: user),
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
                child: HomeIconsInfo('assets/pictures/calendar.jpg', 'Calendar/Events'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/journal.jpg', 'Journal'),
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
                child: HomeIconsInfo('assets/pictures/books.jpg', 'Books'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BooksPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/chores.jpg', 'Chores'),
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
                child: HomeIconsInfo('assets/pictures/homework.jpg', 'Homework'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeworkPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/list.jpg', 'Lists'),
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
                child: HomeIconsInfo('assets/pictures/reports.jpg', 'Reports'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportsPage()),
                  );
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/achievements.jpg', 'Achievements'),
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
      _HomeIconsInfoState();
}

class _HomeIconsInfoState extends State<HomeIconsInfo> {
  String _imagePath;
  String _title;

  @override
  void initState() {
    _imagePath = widget.imagePath;
    _title = widget.title;
    super.initState();
  }

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
          image: AssetImage(_imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: deviceWidth / 2,
        height: 20.0,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.black54,
        ),
        child: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.white70,            
          ),
        ),
      ),
    );
  }
}
