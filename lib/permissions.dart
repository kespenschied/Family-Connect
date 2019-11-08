import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/PermissionsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//need to impliment bools for accessing pages

class PermissionsPage extends StatefulWidget {
   const PermissionsPage({
    Key key,
    @required this.currAccountIDSelected,
    @required this.permissionProvider

  }) : super(key: key);
  final String currAccountIDSelected;
  final permissionProvider;

  @override
  _PermissionsPageState createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
List<Permissions> permissionsDocuments;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Permissions userPermissions = new Permissions();
    String permissionsProfileID = "";
      
    return Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: widget.permissionProvider.fetchPermissionsAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                permissionsDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => Permissions.fromMap(doc.data, doc.documentID)).toList();
                     for (Permissions profile in permissionsDocuments) {
                       if( ((widget.currAccountIDSelected + "_Permission")) ==  profile.id){
                         permissionsProfileID = widget.currAccountIDSelected + "_Permission";
                         userPermissions.achievements = profile.achievements;
                         userPermissions.books = profile.books;
                         userPermissions.calender = profile.calender;
                         userPermissions.chores = profile.chores;
                         userPermissions.homework = profile.homework;
                         userPermissions.journal = profile.journal;
                         userPermissions.lists = profile.lists;
                         userPermissions.email = profile.email;
                         userPermissions.userLevel = profile.userLevel;
                       }
                     } return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Permissions"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
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
        ),
        child: drawBody(width, height,permissionsDocuments, userPermissions, permissionsProfileID, context),
      ),
    );
     }
              else {
                return Text("fetching data");
              }
            }),
          );
  }
  Widget drawBody(double width, double height, List<Permissions> permissionsDocuments, Permissions userPermissions, String permissionsProfileID, BuildContext context) {
    // List<Widget> permissions = [
    //   //////Pull the true false values from database for each user.
    //                           //cardListItems(width, 'Allow All', false),
    //                           cardListItems(width, 'Achievements', false),
    //                           cardListItems(width, 'Books', false),
    //                           cardListItems(width, 'Calendar', true),
    //                           cardListItems(width, 'Chores', true),
    //                           cardListItems(width, 'Homework', true),
    //                           cardListItems(width, 'Journal', true),
    //                           cardListItems(width, 'Lists', false),
    //                           //cardListItems(width, 'Permissions', true),
    //                           cardListItems(width, 'Users', false)];

                                 
   return ListView(
      children: <Widget>[
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                //UserDrawer(),
                SizedBox(height: 10.0,), //This is acting as padding for text.
                SizedBox(
                  height: 50.0,
                  child: Text("Allow user to edit:",
                  style: TextStyle( 
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // drawLeftCards(width, Colors.blue,'assets/pictures/connie.jpg', 'Connie', 'April 10th'),
                   drawCards(width, height, userPermissions, permissionsProfileID, context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );}
             
  

Widget drawCards(double width, double height, Permissions userPermissions, String permissionsProfileID, BuildContext context) {
    double cardWidth = width / 1.05; // 1.125 // 1.05 //This controls width of cards and container.
    double cardHeight = height;
     List<Widget> permissionsList = [
    //   //////Pull the true false values from database for each user.
                              //cardListItems(width, 'Allow All', false),
                              cardListItems(width, 'achievements', userPermissions.achievements, permissionsProfileID, context),
                              cardListItems(width, 'books', userPermissions.books, permissionsProfileID, context),
                              cardListItems(width, 'calendar', userPermissions.calender, permissionsProfileID, context),
                              cardListItems(width, 'chores', userPermissions.chores, permissionsProfileID, context),
                              cardListItems(width, 'homework', userPermissions.homework, permissionsProfileID, context),
                              cardListItems(width, 'journal', userPermissions.journal, permissionsProfileID, context),
                              cardListItems(width, 'lists', userPermissions.lists, permissionsProfileID, context),
                              //cardListItems(width, 'Permissions', true),
                              //cardListItems(width, 'Users', false)
                              ];

    return Container(
      decoration: BoxDecoration(
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
      ),
      
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 200.0),
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 0.0,
        margin: EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
        color: Colors.grey[400],
        child: ListView(
          children: permissionsList
        ),
      ),
    );
  }
  Widget cardListItems(double cardWidth, String listItem, bool value, String permissionsProfileID, BuildContext context) {

    return Card(
      elevation: 15.0,
      margin: EdgeInsets.all(5),
      child: SwitchListTile(
        activeColor: Colors.blue,
        title: Text(
          listItem,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: value,
        onChanged: (bool val) {
          //update the boolvalue on firebase
          _updatePerm(context, permissionsProfileID, listItem, val);
        }, //this is what i play with
      ),
    );
  }

  _updatePerm(BuildContext context, String permissionsProfileID, String listItem, bool val) async{

    Firestore.instance.collection('User_Permissions').document(permissionsProfileID).updateData({
          listItem : val
        });
  }
}
