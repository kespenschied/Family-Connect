//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Lists Page widgets
//Im in the process of redesigning this page 9/17/19 -kole
//Will need a floating action button added to allow
//the user to add a new list to the screen.
//********************************************

import 'package:flutter/material.dart';
import './user_select.dart';

class ListsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListsState();
}

class _ListsState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("List"),
        backgroundColor: Colors.black,
      ),
      body: drawBody(width),
      backgroundColor: Colors.grey,
    );
  }

  Widget drawBody(double width) {
    List<Widget> groceries = [rightCardTitleBar(width, Colors.blue,'Groceries', Icons.add_shopping_cart),
                              rightCardListItems(width, 'Milk', true),
                              rightCardListItems(width, 'Bread', true),
                              rightCardListItems(width, 'Tilapia', false),
                              rightCardListItems(width, 'Coca Cola', true),
                              rightCardListItems(width, 'Lunch Meat', false),
                              rightCardListItems(width, 'Lettuce', false),
                              rightCardListItems(width, 'Tomato', false),
                              rightCardListItems(width, 'Eggs', true)];

    List<Widget> school = [rightCardTitleBar(width, Colors.orange,'School Supplies', Icons.attach_file),
                              rightCardListItems(width, 'Pencils', true),
                              rightCardListItems(width, 'Pens', false),
                              rightCardListItems(width, 'Binders', true),
                              rightCardListItems(width, 'Notebooks', true),
                              rightCardListItems(width, 'Lunch Box', false),
                              rightCardListItems(width, 'New Laptop', false),
                              rightCardListItems(width, 'Calculator', false),
                              rightCardListItems(width, 'Books', true)];
    
    return ListView(
      children: <Widget>[
        UserDrawer(),
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    drawLeftCards(width, Colors.blue,'assets/pictures/connie.jpg', 'Connie', 'April 10th'),
                    drawRightCards(width, groceries),
                  ],
                ),
                Row(
                  children: <Widget>[
                    drawLeftCards(width, Colors.orange,'assets/pictures/collegekid.jpg', 'Josh', 'April 14th'),
                    drawRightCards(width, school),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget drawLeftCards(double width, Color accountColor, String image, String account, String date) {
    double leftCardWidth = width / 3;

    return Container(
      width: leftCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(2.0, 2.0, 0, 5.0),
        color: accountColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: CircleAvatar(
                  maxRadius: 60.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  account,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Posted On:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawRightCards(double width, List<Widget> widgetList) {
    double rightCardWidth = width / 3 * 2;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      width: rightCardWidth,
      height: 360.0,
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(0, 2.0, 2.0, 5.0),
        color: Colors.white70,
        child: ListView(
          children: widgetList
        ),
      ),
    );
  }
}

Widget rightCardTitleBar(double rightCardWidth, Color accountColor, String title, IconData listIcon) {
  return Container(
    width: rightCardWidth,
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

Widget rightCardListItems(double rightCardWidth, String listItem, bool value) {
  return Card(
    elevation: 15.0,
    margin: EdgeInsets.all(1),
    child: CheckboxListTile(
      activeColor: Colors.green,
      title: Text(
        listItem,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: value,
      onChanged: (bool val) {},
    ),
  );
}
