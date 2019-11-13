
//UI
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

import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:family_connect/coreClasses/PermissionsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'Utilities/PermissionsCRUD.dart';
import 'coreClasses/UserModel.dart';
import './account.dart';
import './notifications.dart';
import './editusers.dart';
import './permissions.dart';
import './login.dart';
import 'coreClasses/locator.dart';
import 'package:flutter/scheduler.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
    Key key,
    @required this.user,
    @required this.userIDSelected

  }) : super(key: key);
  final AuthResult user;
   String userIDSelected;
  @override
  _MyDrawerState createState() => new _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>{

List<User> userDocuments;

String _profileName = "";
String _imageURL = "";
String _loggedInProfileID = "";
String _permissionLevel = "";
String _userIDSelectedTest = "";
bool _isLoggedInUserSelected = true;

@override
  void initState() {
    super.initState();
  }

  _updateSelectedUser1(String selectedUser) {
    setState(() {
      widget.userIDSelected = selectedUser;
      _userIDSelectedTest = selectedUser;
      if(_loggedInProfileID == _userIDSelectedTest){
        _isLoggedInUserSelected = true;
      }
      else{
        _isLoggedInUserSelected = false;
      }
    });
    
  }

  @override
  Widget build(BuildContext context){
     var _profileEmail = widget.user.user.email;
     final userProvider = Provider.of<UserCRUD>(context);
     final  permissionProvider = Provider.of<PermissionCRUD>(context);//pathway to firestore/firebase
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
                         _permissionLevel = profile.permissionLevel;
                         _loggedInProfileID = profile.id;
                         _profileName = profile.name; 
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
         return UserAccountsDrawerHeader( //this widget uses the values returned from the streambuilder widget to get a user profile from firebase
            decoration: BoxDecoration(color: Colors.black87),
            accountName: Text(
              _profileEmail,
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: Text( 
              _profileName,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: new NetworkImage(_imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
              }
              else {
                return Text("fetching data");
              }
            }),
          ), //firestore ends here
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
                MaterialPageRoute(builder: (context) => AccountPage(
                  parentAction1: _updateSelectedUser1,
                  userIDSelected: widget.userIDSelected,
                   profileIDLoggedIn:_loggedInProfileID, 
                   userDocuments: userDocuments,
                    permissionProvider: permissionProvider )),
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
          // ListTile(
          //   title: Text(
          //     'Edit Users',
          //     textAlign: TextAlign.end,
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 30.0,
          //     ),
          //   ),
          //   leading: Icon(
          //     Icons.group_add,
          //     size: 35.0,
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UserPage()),
          //     );
          //   },
          // ),
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
                         

            widget.userIDSelected = _userIDSelectedTest; //hack to save currUser
              if(_permissionLevel == "admin"){
                if (_isLoggedInUserSelected == true) {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PermissionsPage(currAccountIDSelected: _loggedInProfileID, permissionProvider: permissionProvider)),
                  );
                } else {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PermissionsPage(currAccountIDSelected: widget.userIDSelected, permissionProvider: permissionProvider)),
                  );
                }

                  }
                  else{
                     failedUpdate();
                  }
             
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
  //logout confirmation box
  void _showLogOutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Log Out?",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          actions: <Widget>[
            ButtonTheme(
              minWidth: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
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

  void failedUpdate() {
    DropdownBanner.showBanner(
      text: 'Not authorized to perform action',
      color: Colors.red,
      textStyle: TextStyle(color: Colors.white),
    );
  }
}