//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Books Page widgets
//********************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}