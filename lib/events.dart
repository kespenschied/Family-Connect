import 'package:flutter/material.dart';

import './drawer.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Events'),
        backgroundColor: Colors.black87,
      ),
      endDrawer: MyDrawer(),
    );
  }
}