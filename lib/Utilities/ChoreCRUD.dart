//DB
//By: Sean Mathews
//October 13th, 2019

//****************************************************************************************
//This class holds functions for getting user data, from the api.dart class
//
//Note: There should be a class like this one for anything else besides users
//****************************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/ChoreModel.dart';
import 'package:family_connect/coreClasses/api.dart';
import 'package:family_connect/coreClasses/locator.dart';
import 'package:flutter/material.dart';

class ChoresCRUD extends ChangeNotifier{
Api _choreApi = choresLocatorHome<Api>();

List<Chore> choreDocuments;

Future<List<Chore>> fetchChores() async {
    var result = await _choreApi.getDataCollection();
    choreDocuments = result.documents
        .map((doc) => Chore.fromMap(doc.data, doc.documentID))
        .toList();
    return choreDocuments;
  }
Stream<QuerySnapshot> fetchChoresAsStream() {
    return _choreApi.streamDataCollection();
  }

Future<Chore> getChoreById(String id) async {
    var doc = await _choreApi.getDocumentById(id);
    return  Chore.fromMap(doc.data, doc.documentID) ;
  }

Future removeChore(String id) async{
     await _choreApi.removeDocument(id) ;
     return ;
  }
  Future updateChore(Chore data,String id) async{
    await _choreApi.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addChore(Chore data) async{
    var result  = await _choreApi.addDocument(data.toJson()) ;
    return ;
  }
}