//DB
//By: Sean Mathews
//October 13th, 2019

//****************************************************************************************
//This class holds functions for getting user data, from the api.dart class
//
//Note: There should be a class like this one for anything else besides users
//****************************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_connect/coreClasses/api.dart';
import 'package:family_connect/coreClasses/locator.dart';
import 'package:family_connect/coreClasses/UserModel.dart';
import 'package:flutter/material.dart';

class UserCRUD extends ChangeNotifier{
Api _api = locatorDrawer<Api>();

List<User> userDocuments;

Future<List<User>> fetchUsers() async {
    var result = await _api.getDataCollection();
    userDocuments = result.documents
        .map((doc) => User.fromMap(doc.data, doc.documentID))
        .toList();
    return userDocuments;
  }
Stream<QuerySnapshot> fetchUsersAsStream() {
    return _api.streamDataCollection();
  }

Future<User> getUserById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  User.fromMap(doc.data, doc.documentID) ;
  }

Future removeUser(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateUser(User data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addUser(User data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return ;
  }
}
