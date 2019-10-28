//By: Kole Espenschied
//April 8th, 2019

//********************************************************
//This class holds the main method and sets the Home page
//********************************************************


import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Family Connect',
      home: DropdownBanner(
      child :LoginPage(),
      navigatorKey: navigatorKey,
      )
    );
  }
}