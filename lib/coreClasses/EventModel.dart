//DB
//By: Megan Ramaker
//October 19th, 2019

//*******************************************************************************
//This class holds all the references for all the Event data passed from firebase
//*******************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';

class Chore {
  String id;
  String date;
  String time;
  String location;
  String child; 
  DocumentReference user;

  Chore({this.id,this.date, this.time, this.location, this.child, this.user});

  Chore.fromMap(Map snapshot,String id) :
        id = id ?? '',
        date = snapshot['date'] ?? '',
        time = snapshot['time'] ?? '',
        location = snapshot['location'] ?? '',
        child = snapshot['child'] ?? '',
        user = snapshot['user'] ?? '';

  toJson() {
    return {
      "date": date,
      "time": time,
      "location": location,
      "child": child,
      "user": user,
    };
  }
}
