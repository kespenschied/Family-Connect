//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Home/Landing widgets
//**********************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/PermissionsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './achievements.dart';
import './books.dart';
import './chores.dart';
import './events.dart';
import './reports.dart';
import './homework.dart';
import './journal.dart';
import './lists.dart';
import './drawer.dart';
import 'Utilities/UserCRUD.dart';

//this Home Page class creates the scaffold and the appBar for this page

import 'coreClasses/locator.dart';
class HomePage extends StatefulWidget {
 const HomePage({
    Key key,
    @required this.user
    
  }) : super(key: key);

  final AuthResult user;
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locator<UserCRUD>()),
      ],
      child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(user: widget.user),
      body: Center(
        child: HomeController(user: widget.user),
      ),
    ),
    );
  }



}

//This class defines the layout for the Home Page widgets. It also
//sets sets a gesture listener to each Container as to go to the
//correct page. Calls 'HomeIconInfo's constructor to build each
//container on the screen.

class HomeController extends StatefulWidget {

   const HomeController({
    Key key,
    @required this.user
    
  }) : super(key: key);

  final AuthResult user;

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  List<Permissions> userDocuments;
  Permissions _permissions = new Permissions();

  @override
  Widget build(BuildContext context) {
    var _profileEmail = widget.user.user.email;
  final userProvider = Provider.of<UserCRUD>(context);

    return Container(
      alignment: FractionalOffset.center,
    child: Container(
      child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: userProvider.fetchUsersAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                userDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => Permissions.fromMap(doc.data, doc.documentID)).toList();
                     for (Permissions profile in userDocuments) {
                       if(profile.email ==  _profileEmail){
                         _permissions.achievements = profile.achievements;
                         _permissions.books = profile.books;
                         _permissions.calender = profile.calender;
                         _permissions.chores = profile.chores;
                         _permissions.email = profile.email;
                         _permissions.homework = profile.homework;
                         _permissions.journal = profile.journal;
                         _permissions.lists = profile.lists;
                         _permissions.userLevel = profile.userLevel;
                       }
                     }
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/calendar.jpg', 'Calendar/Events'),
                onTap: () {

                  if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                  }
                  else if(_permissions.calender == true){
                    
                  }
                  else{

                  }

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
      );
 }
              else {
                return Text("fetching data");
              }
            }),
    ));
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
