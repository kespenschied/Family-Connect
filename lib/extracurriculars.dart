import 'package:flutter/material.dart';

import './drawer.dart';

class ExtracurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Extracurriculars'),
        backgroundColor: Colors.black87,
      ),
      endDrawer: MyDrawer(),
    );
  }
}