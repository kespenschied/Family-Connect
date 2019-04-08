import 'package:flutter/material.dart';

import './drawer.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books'),
        backgroundColor: Colors.black87,
      ),
      endDrawer: MyDrawer(),
    );
  }
}