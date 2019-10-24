//By: Kole Espenschied
//April 8th, 2019

//***********************************************
//This class holds all the Homework Page widgets
//In the process of redesigning this page 9/17/19 -Kole
//Will need to add a floating action button to allow the
//user to create a new homework list.
//***********************************************

import 'package:flutter/material.dart';
import 'package:family_connect/user_select.dart';

//final GlobalKey<UserDrawerState> userKey = new GlobalKey<UserDrawerState>();

class HomeworkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeworkState();
}

class _HomeworkState extends State<HomeworkPage> {      
   var isItChecked = List<bool>.generate(9, (i) => false);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
      children: <Widget>[
        //UserDrawer(key: userKey),
        //UserDrawer(),
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),                  
                ),
                //titleBar(Colors.green, (userKey.currentState != null) ? userKey.currentState.currentUser : "RELOAD", Icons.create),
                titleBar(Colors.green, 'NAME', Icons.create),
                listItems('Math', 'Problems 1-10\nDue: 04/19', 0),
                listItems('History', 'Read Chapter 3\nDue: 04/20', 1),
                listItems('History', 'Do Ch. 3 Problems\nDue: 04/22', 2),
                listItems('English', 'Do Grammar Assignment\nDue: 04/23', 3),
                listItems('Art', 'Finish Poster\nDue: 04/23', 4),
                listItems('History', 'Read Chapter 3\nDue: 04/20', 5),
                listItems('History', 'Do Ch. 3 Problems\nDue: 04/22', 6),
                listItems('English', 'Do Grammar Assignment\nDue: 04/23', 7),
                listItems('Art', 'Finish Poster\nDue: 04/23', 8),
              ],
            ),
          ),
        ),
      ],
    ),
      backgroundColor: Colors.grey,
    );
  }

  /* Widget userChanged() {
    

    return ValueListenableBuilder(valueListenable: data, builder: (BuildContext context, String value, Widget child) {
      return titleBar(Colors.red, value, Icons.create);
    });
  } */

  /* Future testFuture() async {
    return titleBar(Colors.green, (userKey.currentState != null) ? "WORKED" : "FAILED", Icons.create);
  } */

  Widget titleBar(
      Color accountColor, String title, IconData listIcon) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        color: accountColor,
        margin: EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(
            listIcon,
            size: 30.0,
            color: Colors.black,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget listItems(String listItem, String info, int index) {
    return Card(
      elevation: 15.0,
      margin: EdgeInsets.all(1),
      child: CheckboxListTile(
        activeColor: Colors.green,
        isThreeLine: true,
        title: Text(
          listItem,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          info,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        value: isItChecked[index],
        onChanged: (bool val) {
          setState(() {
            isItChecked[index] = val;
          });
        },
      ),
    );
  }
}
