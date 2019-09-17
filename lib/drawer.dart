//By: Kole Espenschied
//April 8th, 2019

//********************************************************************
//This class holds all the Drawer (appBar hamburger menu) Page widgets
//We can add the 'user_select.dart' to the top of 'account.dart' and
//eliminate the need for an editUsers page. Also on the logOut
//********************************************************************

import 'package:flutter/material.dart';

import './account.dart';
import './notifications.dart';
import './editusers.dart';
import './permissions.dart';
import './login.dart';

class MyDrawer extends StatelessWidget {
  //logout confirmation box, will need to actually sign the user out of firebase
  //as of now it just pops all the pages off the stack and returns you to the login page.
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
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
