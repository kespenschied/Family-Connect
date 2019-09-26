//By: Kole Espenschied
//April 8th, 2019

//******************************************************
//This class holds all the Reports Page widgets. Low priority
// Will be the page where a user can print shit out
//******************************************************

import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reports'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: _backgroundStyling(),
      ),
    );
  }
}

BoxDecoration _backgroundStyling() {
  return BoxDecoration(
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
  );
}
