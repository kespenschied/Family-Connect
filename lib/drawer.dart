//By: Kole Espenschied
//April 8th, 2019

//********************************************************************
//This class holds all the Drawer (appBar hamburger menu) Page widgets
//********************************************************************

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
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
                    image: AssetImage('assets/connie.jpg'),
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
          ),
          ListTile(
            title: Text(
              'Print',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(
              Icons.print,
              size: 35.0,
            ),
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
          ),
        ],
      ),
    );
  }
}
