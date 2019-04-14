import 'package:flutter/material.dart';

import './lists.dart';
import './drawer.dart';

class FamilyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: Center(
        child: FamilyListController(),
      ),
    );
  }
}

class FamilyListController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}