//By: Kole Espenschied
//April 8th, 2019

//********************************************************************
//This class holds all the Drawer (appBar hamburger menu) Page widgets
//********************************************************************

import 'dart:io';
import 'dart:typed_data';

import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'coreClasses/UserModel.dart';
import 'coreClasses/locator.dart';
import 'coreClasses/api.dart';

import './account.dart';
import './notifications.dart';
import './editusers.dart';
import './permissions.dart';
import './login.dart';

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
var _profileEmail = "";

final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://my-project.appspot.com');

  Uint8List imageBytes;
  String errorMsg;


  @override
  Widget build(BuildContext context){
    var _profileEmail = widget.user.user.email;
     final userProvider = Provider.of<UserCRUD>(context);
        return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          Container( //firestore starts here
            child: StreamBuilder(
              stream: userProvider.fetchUsersAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

              if(snapshot.data == null) return CircularProgressIndicator();
              if (snapshot.hasData) {
                userDocuments = snapshot.data.documents
                    .map((doc) => User.fromMap(doc.data, doc.documentID)).toList();
                     for (User profile in userDocuments) {
                       if(profile.email ==  _profileEmail){
                         _profileName = profile.name;
                       }
                     }
         return UserAccountsDrawerHeader(
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
                    image: getProfilePic(),
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
                MaterialPageRoute(builder: (context) => AccountPage()),
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
              'Edit User',
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
    
  

  String testFunc(){
    var name = "name";
    return name;
  }

  getProfilePic() async {
    final StorageReference ref = FirebaseStorage.instance.ref().child('connie.jpg');
    String downloadURL = await ref.getDownloadURL();

    downloadURL = Uri.decodeFull(downloadURL.toString());
    print("FB Storage URL: $downloadURL");


    return new NetworkImage(downloadURL);
  }

  

  Future<String> getProfileName(profileEmail, profileName) async{
    
    //       _db
    //       .collection("User")
    //       .getDocuments()
    //       .then((QuerySnapshot snapshot) {
    //     snapshot.documents.forEach((doc) {
    //       if(doc["email"] ==  profileEmail){
    //          profileName = doc["name"];
    //         }
    //     });
    //       });  
    // return _profileName;
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
}