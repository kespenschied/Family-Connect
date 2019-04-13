//By: Kole Espenschied
//April 8th, 2019

//**********************************************
//This class holds all the Jpurnal Page widgets
//**********************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Journal'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}