


import 'package:flutter/src/widgets/framework.dart';

class User {
  String email;
  String permissionLevel;
  String name;
  String userPicture;

  User({this.email, this.permissionLevel, this.name,this.userPicture});

  User.fromMap(Map snapshot,String email) :
        email = email ?? '',
        permissionLevel = snapshot['permissionLevel'] ?? '',
        name = snapshot['name'] ?? '',
        userPicture = snapshot['userPicture'] ?? '';

  toJson() {
    return {
      "permissionLevel": permissionLevel,
      "name": name,
      "userPicture": userPicture,
    };
  }

  static of(BuildContext context) {}
}