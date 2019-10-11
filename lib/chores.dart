//By: Kole Espenschied
//April 8th, 2019

//*********************************************
//This class holds all the Chores Page widgets
//I'm in a process of redesigning this page 9/17/19 -Kole
//Will need to add a floating action button to allow
//the user to add a new list to the page.
//*********************************************


import 'package:flutter/material.dart';
import './user_select.dart';

class ChoresPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChoresState();
}

// class ChoresPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Chores'),
//         backgroundColor: Colors.black,
//       ),
//       endDrawer: MyDrawer(),
//     );
//   }
// }
