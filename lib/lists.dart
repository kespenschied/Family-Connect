//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Lists Page widgets
//********************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class ListsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lists'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}