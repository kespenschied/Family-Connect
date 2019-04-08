//By: Kole Espenschied
//April 8th, 2019

//******************************************************
//This class holds all the Events/Calendar Page widgets
//******************************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Events'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}