import 'package:flutter/material.dart';

import './home_controller.dart';
import './drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.black87,
      ),
      endDrawer: MyDrawer(),
      body: Center(
        child: HomeController(),
      ),
    );
  }
}
