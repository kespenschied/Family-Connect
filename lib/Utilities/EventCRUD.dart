//DB
//By: Megan Ramaker
//October 19, 2019

//****************************************************************************************
//This class holds functions for getting user data, from the api.dart class
//
//Note: There should be a class like this one for anything else besides users
//****************************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/EventModel.dart';
import 'package:family_connect/coreClasses/api.dart';
import 'package:family_connect/coreClasses/locator.dart';
import 'package:flutter/material.dart';

class EventCRUD extends ChangeNotifier{
Api _eventApi = locator<Api>();

List<Event> eventDocuments;

Future<List<Event>> fetchEvents() async {
    var result = await _eventApi.getDataCollection();
    eventDocuments = result.documents
        .map((doc) => Event.fromMap(doc.data, doc.documentID))
        .toList();
    return eventDocuments;
  }
Stream<QuerySnapshot> fetchChoresAsStream() {
    return _eventApi.streamDataCollection();
  }

Future<Event> getEventById(String id) async {
    var doc = await _eventApi.getDocumentById(id);
    return  Event.fromMap(doc.data, doc.documentID) ;
  }

Future removeEvent(String id) async{
     await _eventApi.removeDocument(id) ;
     return ;
  }
  Future updateEvent(Chore data,String id) async{
    await _eventApi.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addEvent(Chore data) async{
    var result  = await _eventApi.addDocument(data.toJson()) ;
    return ;
  }
}
