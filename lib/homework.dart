import 'package:flutter/material.dart';

import './drawer.dart';

class HomeworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        backgroundColor: Colors.black87,
      ),
      endDrawer: MyDrawer(),
    );
  }
}