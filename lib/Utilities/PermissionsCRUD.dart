//DB
//By: Sean Mathews
//October 13th, 2019

//****************************************************************************************
//This class holds functions for getting user data, from the api.dart class
//
//Note: There should be a class like this one for anything else besides users
//****************************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/PermissionsModel.dart';
import 'package:family_connect/coreClasses/api.dart';
import 'package:family_connect/coreClasses/locator.dart';
import 'package:flutter/material.dart';

class PermissionCRUD extends ChangeNotifier{
Api _api = locator<Api>();

List<Permissions> permissionsDocuments;

Future<List<Permissions>> fetchPermissions() async {
    var result = await _api.getDataCollection();
    permissionsDocuments = result.documents
        .map((doc) => Permissions.fromMap(doc.data, doc.documentID))
        .toList();
    return permissionsDocuments;
  }
Stream<QuerySnapshot> fetchPermissionsAsStream() {
    return _api.streamDataCollection();
  }

Future<Permissions> getPermissionsById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Permissions.fromMap(doc.data, doc.documentID) ;
  }

Future removePermissions(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updatePermissions(Permissions data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addPermissions(Permissions data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return ;
  }
}