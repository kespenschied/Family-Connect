//DB
//By: Megan Ramaker
//October 19th, 2019

//*******************************************************************************
//This class holds all the references for all the Event data passed from firebase
//*******************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String title;
  DateTime time;
  String notes;
  String child; 
  String documentID;

  Event(this.title, this.time, this.notes, this.child, [this.documentID]);

  //Event.fromMap(Map snapshot,String id) :
  //      id = id ?? '',
  //      title = snapshot['title'] ?? '',
  //      date = snapshot['date'] ?? '',
  //      time = snapshot['time'] ?? '',
  //      location = snapshot['location'] ?? '',
  //      child = snapshot['child'] ?? '',
  //      user = snapshot['user'] ?? '';

  //toJson() {
  //  return {
  //    "date": date,
  //    "title": title,
  //    "time": time,
  //    "location": location,
  //    "child": child,
  //    "user": user,
  //  };
 // }
}
