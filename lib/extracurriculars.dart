//By: Kole Espenschied
//April 8th, 2019

//******************************************************
//This class holds all the Extracurriculars Page widgets
//******************************************************


import 'package:flutter/material.dart';

import './drawer.dart';

class ExtracurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Extracurriculars'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
    );
  }
}