//DB
//By: Sean Mathews
//October 14th, 2019

//*******************************************************************************
//This class holds all the references for all the Chore data passed from firebase
//*******************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';

class Chore {
  String id;
  String titleName;
  List<String> listItems = new List<String>();
  List<String> time = new List<String>();
  String email;

  Chore({this.id,this.titleName, this.listItems, this.time, this.email});

  Chore.fromMap(Map snapshot,String id) :
        id = id ?? '',
        titleName = snapshot['titleName'] ?? '',
        listItems = List.from(snapshot['listItems']),
        time = List.from(snapshot['time']),
        email = snapshot['email'] ?? '';

  toJson() {
    return {
      "titleName": titleName,
      "listItems": listItems,
      "time": time,
      "email": email
    };
  }
}