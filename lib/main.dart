<<<<<<< HEAD








=======
//By: Kole Espenschied
//April 8th, 2019

//********************************************************
//This class holds the main method and sets the Home page
//********************************************************


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Family Connect',
      home: HomePage(),
    );
  }
}
>>>>>>> e45cb94029a0557967b3df30e013039cc41a7f4b
