//DB
//By: Megan Ramaker
//October 19th, 2019

//*******************************************************************************
//This class holds all the references for all the Event data passed from firebase
//*******************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final DateTime time;
  final String notes;
  //String child; 
  //String documentID;

  Event({ this.id, this.title, this.time, this.notes});

  factory Event.fromFirestore(DocumentSnapshot doc)
  {
    Map data = doc.data;

    return Event(
      id: doc.documentID,
      title: data['title'] ?? '',
      time: data['time'] ?? '',
      notes: data['notes'] ?? '',
    );

  }
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
