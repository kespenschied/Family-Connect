import 'package:flutter/material.dart';
import './user_select.dart';

//need to impliment bools for accessing pages

class PermissionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
        child: drawBody(width, height),
      ),

    );

  }
  Widget drawBody(double width, double height) {
    List<Widget> permissions = [
      //////Pull the true false values from database for each user.
                              //cardListItems(width, 'Allow All', false),
                              cardListItems(width, 'Achievements', false),
                              cardListItems(width, 'Books', false),
                              cardListItems(width, 'Calendar', true),
                              cardListItems(width, 'Chores', true),
                              cardListItems(width, 'Homework', true),
                              cardListItems(width, 'Journal', true),
                              cardListItems(width, 'Lists', false),
                              //cardListItems(width, 'Permissions', true),
                              cardListItems(width, 'Users', false)];
                                  
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
                   drawCards(width, height, permissions),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

Widget drawCards(double width, double height, List<Widget> widgetList) {
    double cardWidth = width / 1.05; // 1.125 // 1.05 //This controls width of cards and container.
    double cardHeight = height;

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
          children: widgetList
        ),
      ),
    );
  }
  Widget cardListItems(double cardWidth, String listItem, bool value) {
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
        onChanged: (bool val) {},
      ),
    );
  }
}
