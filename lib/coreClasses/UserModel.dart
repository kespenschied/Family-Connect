



import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String email;
  String permissionLevel;
  String name;
  DocumentReference userPicture;
  String password;

  User({this.id,this.email, this.permissionLevel, this.name,this.userPicture, this.password});

  User.fromMap(Map snapshot,String id) :
        id = id ?? '',
        email = snapshot['email'] ?? '',
        permissionLevel = snapshot['permissionLevel'] ?? '',
        name = snapshot['name'] ?? '',
        userPicture = snapshot['userPicture'] ?? '',
        password = snapshot['password'] ?? '';

  toJson() {
    return {
      "email": email,
      "permissionLevel": permissionLevel,
      "password": password,
      "name": name,
      "userPicture": userPicture,
    };
  }
}