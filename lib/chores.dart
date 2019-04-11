//By: Kole Espenschied
//April 8th, 2019

//*********************************************
//This class holds all the Chores Page widgets
//*********************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class ChoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chores'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}