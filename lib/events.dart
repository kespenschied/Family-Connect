//By: Troy Nance
//April 12th, 2019

//******************************************************
//This class holds all the Events/Calendar Page widgets
//******************************************************

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:folding_cell/folding_cell.dart';
import './drawer.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar'),
        backgroundColor: Colors.green,
      ),

      body: Container(
        color: Colors.blue,
        child:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // Each of these Containers creates a new "event"
            Container(
              child:SimpleFoldingCell(
                frontWidget: FrontWidget("Wednesday", "1:15PM", "CS 425 Presentation", "SIUE EB0125"),
                innerTopWidget: InnerTopWidget("Lecture", "1:15PM - 2:45PM", "EB1024", "High Priority"),
                innerBottomWidget: InnerBottomWidget("Chris", "Kole", "Megan", "Sean", "Troy"),

                cellSize: Size(MediaQuery.of(context).size.width, 175),
                padding: EdgeInsets.all(10.0),
              ),
            ),

            Container(
              child:SimpleFoldingCell(
                frontWidget: FrontWidget("Wednesday", "12:00PM", "CS 447 Lecture", "SIUE EB2024"),
                innerTopWidget: InnerTopWidget("Lecture", "12:00PM - 1:15PM", "EB2024", "High Priority"),
                innerBottomWidget: InnerBottomWidget("Chris", "Kole", "Troy", "", ""),

                cellSize: Size(MediaQuery.of(context).size.width, 175),
                padding: EdgeInsets.all(10.0),
              ),
            ),

            Container(
              child:SimpleFoldingCell(
                frontWidget: FrontWidget("Monday", "3:00PM", "CS 490 Lecture", "SIUE EB1024"),
                innerTopWidget: InnerTopWidget("Lecture", "3:00PM - 4:15PM", "EB1024", "Medium Priority"),
                innerBottomWidget: InnerBottomWidget("Kole", "Megan", "Troy", "", ""),

                cellSize: Size(MediaQuery.of(context).size.width, 175),
                padding: EdgeInsets.all(10.0),
              ),
            ),
          ],
        )
      ),

      endDrawer: MyDrawer(),
    );
  }
}

// The Details box
Container InnerTopWidget(title, duration, location, priority) {
  return Container(
    color: Color(0xff6a5da4),
    alignment: Alignment.center,
    child: Container(
      child: Column(children: <Widget>[

        //heading
        Container(child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("Details",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            )),
        )),

        //title
        Container(
          child: Row(children: <Widget>[
            // Title Icon
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.chalkboard,
                color: Colors.orange,
                size: 20.0,
              )
            )),

              //Title description
            Container(child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
            ),),
          ])
        ),

        //Duration
        Container(
          child: Row(children: <Widget>[
            // Duration Icon
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.clock,
                color: Colors.orange,
                size: 20.0,
              )
            )),

            // Duration description
            Container(child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(duration,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
            ),),
          ])
        ),

        //Location
        Container(
          child: Row(children: <Widget>[
            // Location Icon
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.mapMarkerAlt,
                color: Colors.orange,
                size: 20.0,
              )
            )),

            // Location description
            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(location,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  ),),
          ])
        ),

        //Priority
        Container(
          child: Row(children: <Widget>[
            // Priority Icon
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.sith,
                color: Colors.orange,
                size: 20.0,
              )
            )),

            // Priority description
            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(priority,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  ),), //text
          ])
        ),
      ]),
    )
  );
}

// The Guest List box
Container InnerBottomWidget(name1, name2, name3, name4, name5) {
  return Container(
    color: Colors.white,
    child: Column(children: <Widget>[
      Container(
        child:Column(
          children: <Widget>[
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Guest List - Going",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))
            ))
          ],
        )
      ), // title

      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name1,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
            )),

            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name2,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
            )),

            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name3,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
            )),

            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name4,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
            )),

            Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name5,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
            )),
            //profiles
          ],
        )
      ),

      //button
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // button icon
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.orange,
                size: 20.0,
              )
            )),

            // button description
            Container(child:new RaisedButton(
                child: const Text('Set Reminder'),
                color: Colors.orange,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  // Perform some action
                },
              ),
            ),
          ])
      ),
    ],)
  );
}

// The first Widget the user sees, the one with the time box on the left and the title box on the right
Container FrontWidget(day, time, title, location) {
  return Container(
    color: Colors.blue,
    alignment: Alignment.center,
    child: Row(children: <Widget>[
      Expanded(
        flex: 3,
        child:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.orange,
          ),

        child:Container(
          child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
              Container(
                child: Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Text(day,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      ), 
                    ),
                  )
                ),


              Container(
                child: Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Text(time,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      ), 
                    ),
                  )
                ),
            ],)
          ],)
        ),

        ),
      ),

      Expanded(
        flex: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color:Colors.white,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                  style: TextStyle(
                    color: Color(0xff6a53a4),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              )),

              Container(
                child: Row(children: <Widget>[
                  Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.orange,
                      size: 20.0,),
                  ),),

                  Container(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(location,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  ),),
                ],)
              ),
            ],)
        ),
      ),
    ],),);
} 