//By: Kole Espenschied
//April 8th, 2019

//***********************************************
//This class holds all the Homework Page widgets
//***********************************************


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './drawer.dart';

class HomeworkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeworkPage();
}

class _HomeworkPage extends State<HomeworkPage> {

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
}

//when done with the page set it to portrait mode
@override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
        body: 

    );
  }
}