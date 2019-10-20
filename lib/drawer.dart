//By: Kole Espenschied
//April 8th, 2019

//********************************************************************
//This class holds all the Drawer (appBar hamburger menu) Page widgets
//We can add the 'user_select.dart' to the top of 'account.dart' and
//eliminate the need for an editUsers page. Also on the logOut
//********************************************************************

//DB
//By: Sean Mathews
//October 12th, 2019

import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './account.dart';
import './notifications.dart';
import './editusers.dart';
import './permissions.dart';
import './login.dart';
import 'coreClasses/locator.dart';

class MyDrawer extends StatefulWidget {
 const MyDrawer({
    Key key,
    @required this.user
    
  }) : super(key: key);

  final AuthResult user;
  
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>{

List<User> userDocuments;

String _profileName = "";
String _imageURL = "";
String _profileID = "";

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
     var _profileEmail = widget.user.user.email;
     final userProvider = Provider.of<UserCRUD>(context);
        return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: userProvider.fetchUsersAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                userDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => User.fromMap(doc.data, doc.documentID)).toList();
                     for (User profile in userDocuments) {
                       if(profile.email ==  _profileEmail){
                         _profileID = profile.id;
                         _profileName = profile.name; 
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
         return UserAccountsDrawerHeader( //this widget uses the values returned from the streambuilder widget to get a user profile from firebase
            decoration: BoxDecoration(color: Colors.black87),
            accountName: Text(
              "Connie Barber",
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: Text(
              "cobarbe@siue.edu",
              style: TextStyle(fontSize: 15.0),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/pictures/connie.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Account',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.account_circle,
              size: 35.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage(profileID: _profileID,userDocuments: userDocuments )),
              );
            },
          ),
          ListTile(
            title: Text(
              'Notifications',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.notifications,
              size: 35.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Edit Users',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.group_add,
              size: 35.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Permissions',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.remove_red_eye,
              size: 35.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PermissionsPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Log Out',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.close,
              size: 35.0,
            ),
            onTap: () {
              _showLogOutConfirmation(context);
            },
          ),
        ],
      ),
    );
  }
}
