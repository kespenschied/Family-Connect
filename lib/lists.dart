//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Lists Page widgets
//********************************************


import 'package:flutter/material.dart';

import './drawer.dart';


class ListsPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("List"),
        backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
      body: Center(
        child: ListController(),
      ),
    );
  }
}

class ListController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: ListIconsInfo('assets/christmaslist.jpg', 'Christmas'),
               
              ),
              GestureDetector(
                child: ListIconsInfo('assets/shippinglist.jpg', 'Shopping'),
               
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: ListIconsInfo('assets/birthdaylist.jpg', 'Birthday'),
                
              ),
              GestureDetector(
                child: ListIconsInfo('assets/schoolsupplies.jpg', 'School Supplies'),
               
              ),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: ListIconsInfo('assets/clothinglist.jpg', 'Clothing'),
                
              ),
              GestureDetector(
                child: ListIconsInfo('assets/other.jpg', 'Other'),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
} 

class ListIconsInfo extends StatefulWidget {
  final String imagePath;
  final String title;

  ListIconsInfo(this.imagePath, this.title);

  @override
  _ListIconsInfoState createState() =>
      _ListIconsInfoState(this.imagePath, this.title);
}

class _ListIconsInfoState extends State<ListIconsInfo> {
  String _imagePath;
  String _title;

  _ListIconsInfoState(this._imagePath, this._title);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double deviceWidth = width * 1.00;
    double deviceHeight = height * 0.2207;

    return Container(
      width: deviceWidth / 2,
      height: deviceHeight,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: deviceWidth / 2,
        height: 20.0,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.black54,
        ),
        child: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.white70,            
          ),
        ),
      ),
    );
  }
}