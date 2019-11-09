import 'package:family_connect/user_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account"),
        backgroundColor: Colors.black,
      ),
      body: new Stack(
        children: <Widget>[
          Container(
        
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
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          //top: MediaQuery.of(context).size.height / 15,
          child: Column(
            children: <Widget>[
              UserDrawer(), //Need to pull the selected user which should be the value: of UserDrawer.
              SizedBox(height: 20.0,), //Spacing
              Container(
                alignment: Alignment.bottomCenter, //Aligns the text on top of photo.
                padding: const EdgeInsets.only(bottom: 25,), //Extra padding to put text more central
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: new DecorationImage(
                    image: AssetImage('assets/pictures/connie.jpg'), //////Pull from database
                    fit: BoxFit.fill,
                    
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)
                  ),
                  boxShadow: [BoxShadow(blurRadius: 5.0, color: Colors.black)]
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 140.0,
                    height: 30.0,
                    alignment: Alignment.bottomCenter,
                    ////Edit function should show if user has access
                    child: Text('Edit Photo', style: TextStyle(fontSize: 22, color: Colors.white),), 
                  )
                )
              ),
              SizedBox(height: 20.0,), //Space between items.
              Text('Connie Barber', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),), ///////This needs to pull from database
              SizedBox(height: 15,), //Space between items.
              Container( // Create space for text
                height: 30.0,
                width: 95.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {}, //Implement functionality of changing the user's name.
                    child: Center(
                      ////Edit function should show if user has access
                      child: Text('Edit name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
              SizedBox(height: 25.0,),
              Text('cobarbe@siue.edu', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),), //////This will need to pull from database
              SizedBox(height: 15.0,),
              Container(
                height: 30.0,
                width: 95.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {}, //Implement functionality of changing the user's name.
                    child: Center(
                      ////Edit function should show if user has access
                      child: Text('Edit email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
              SizedBox(height: 60.0,),
              Container(
                height: 30.0,
                width: 160.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {}, //Implement functionality of changing the user's name.
                    child: Center(
                      ////Edit function should show if user has access
                      child: Text('Change password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
            ],
          ),
        )
        ]
      )
    );
  }
}