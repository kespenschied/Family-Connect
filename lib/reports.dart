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
    );
  }
}