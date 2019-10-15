//DB
//By: Sean Mathews
//October 14th, 2019

//*******************************************************************************
//This class holds all the references for all the Chore data passed from firebase
//*******************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';

class Chore {
  String id;
  String date;
  String description;
  String name;
  String reward;
  String time;
  DocumentReference user;

  Chore({this.id,this.date, this.description, this.name, this.reward,this.time, this.user});

  Chore.fromMap(Map snapshot,String id) :
        id = id ?? '',
        date = snapshot['date'] ?? '',
        description = snapshot['time'] ?? '',
        name = snapshot['name'] ?? '',
        reward = snapshot['reward'] ?? '',
        time = snapshot['time'] ?? '',
        user = snapshot['user'] ?? '';

  toJson() {
    return {
      "date": date,
      "description": description,
      "name": name,
      "user": user,
      "reward": reward,
      "time": time,
    };
  }
}