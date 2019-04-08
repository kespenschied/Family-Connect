import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './MainMenu.dart';

void main() => runApp(new MaterialApp(home: new MyTabs()));

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Favourites"),
        backgroundColor: Colors.green,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: Icon(Icons.home)),
            new Tab(icon: Icon(Icons.looks_one)),
            new Tab(icon: Icon(Icons.looks_two))
          ],
        ),
      ),
      body: MainMenuButtons(),
    );
  }
}





