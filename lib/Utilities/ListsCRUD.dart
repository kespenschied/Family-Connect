//DB
//By: Chris Blaylock
//November 9th, 2019

//****************************************************************************************
//This class holds functions for getting user data, from the api.dart class
//****************************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/api.dart';
import 'package:family_connect/coreClasses/locator.dart';
import 'package:family_connect/coreClasses/ListsModel.dart';
import 'package:family_connect/coreClasses/UserModel.dart';
import 'package:flutter/material.dart';

class ListsCRUD extends ChangeNotifier{
Api _listsApi = listsLocatorHome<Api>();

List<Lists> listsDocuments;

Future<List<Lists>> fetchLists() async {
    var result = await _listsApi.getDataCollection();
    listsDocuments = result.documents
        .map((doc) => Lists.fromMap(doc.data, doc.documentID))
        .toList();
    return listsDocuments;
  }
Stream<QuerySnapshot> fetchListsAsStream() {
    return _listsApi.streamDataCollection();
  }

Future<Lists> getListsById(String id) async {
    var doc = await _listsApi.getDocumentById(id);
    return  Lists.fromMap(doc.data, doc.documentID) ;
  }

Future removeList(String id) async{
     await _listsApi.removeDocument(id) ;
     return ;
  }
  Future updateList(User data,String id) async{
    await _listsApi.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addList(User data) async{
    var result  = await _listsApi.addDocument(data.toJson()) ;
    return ;
  }
}
