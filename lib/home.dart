//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Home/Landing widgets
//**********************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_banner/dropdown_banner.dart';
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
import 'Utilities/ChoreCRUD.dart';
import 'Utilities/PermissionsCRUD.dart';
import 'Utilities/UserCRUD.dart';

//this Home Page class creates the scaffold and the appBar for this page

import 'Utilities/UserCRUDHome.dart';
import 'coreClasses/UserModel.dart';
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
String userIDSelected = "";
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locatorDrawer<UserCRUD>()),
        ChangeNotifierProvider.value(value: permissionLocatorDrawer<PermissionCRUD>()),
        //--------------------------------------------------------------//
        ChangeNotifierProvider.value(value: locatorHome<UserCRUDHome>()), 
        ChangeNotifierProvider.value(value: choresLocatorHome<ChoresCRUD>()), 
      ],
      child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(user: widget.user, userIDSelected: userIDSelected),
      body: Center(
        child: HomeController(user: widget.user),
      ),
    ),
    );
  }

//make a function that gets permissions and returns it

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

String _profileName = "";
String _imageURL = "";
String _loggedInProfileID = "";
String _permissionLevel = "";
String _userIDSelectedTest = "";
  Permissions _permissions = new Permissions();
  List<User> userDocuments;
  @override
  Widget build(BuildContext context) {
    var _profileEmail = widget.user.user.email;
    final userHomeProvider = Provider.of<UserCRUDHome>(context);
    final choreProvider = Provider.of<ChoresCRUD>(context);
    return  Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: userHomeProvider.fetchUsersAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                userDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => User.fromMap(doc.data, doc.documentID)).toList();
                     for (User profile in userDocuments) {
                       if(profile.email ==  _profileEmail){
                         _permissionLevel = profile.permissionLevel;
                         _loggedInProfileID = profile.id;
                         _profileName = profile.name; 
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/calendar.jpg', 'Calendar/Events'),
                onTap: () {

                 // if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                  // }
                  // else if(_permissions.calender == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EventsPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }

                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/journal.jpg', 'Journal'),
                onTap: () {

                   //if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JournalPage()),
                  );
                  // }
                  // else if(_permissions.journal == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => JournalPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/books.jpg', 'Books'),
                onTap: () {
                  
                   //if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BooksPage()),
                  );
                  // }
                  // else if(_permissions.books == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BooksPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                 
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/chores.jpg', 'Chores'),
                onTap: () {

                  
                  // if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoresPage(choreProvider: choreProvider, userDocuments: userDocuments, profileEmail: _profileEmail)),
                  );
                  // }
                  // else if(_permissions.chores == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChoresPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
            
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/homework.jpg', 'Homework'),
                onTap: () {

                 // if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeworkPage()),
                  );
                  // }
                  // else if(_permissions.homework == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeworkPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                  
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/list.jpg', 'Lists'),
                onTap: () {

                  
                  //if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListsPage()),
                  );
                  // }
                  // else if(_permissions.lists == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ListsPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                  
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/reports.jpg', 'Reports'),
                onTap: () {
                   //if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportsPage()),
                  );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                
                },
              ),
              GestureDetector(
                child: HomeIconsInfo('assets/pictures/achievements.jpg', 'Achievements'),
                onTap: () {
                    //if(_permissions.userLevel == "Admin"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AchievementsPage()),
                  );
                  // }
                  // else if(_permissions.achievements == true){
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AchievementsPage()),
                  // );
                  // }
                  // else{
                  //    failedUpdate();
                  // }
                 
                },
              ),
            ],
          ),
        ],
      ));
      }
              else {
                return Text("fetching data");
              }
            }),
          );
 }
  //             else {
  //               return Text("fetching data");
  //             }
  //           }),
  //   ));
  // }

   void failedUpdate() {
    DropdownBanner.showBanner(
      text: 'Email or password is incorrect',
      color: Colors.red,
      textStyle: TextStyle(color: Colors.white),
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
