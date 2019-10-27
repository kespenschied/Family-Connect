//DB
//By: Sean Mathews
//October 13th, 2019

//*******************************************************************************
//This class holds all the references for all the User data passed from firebase
//*******************************************************************************

class User {
  String id;
  String email;
  String permissionLevel;
  String name;
  String userImageURL;
  String password;

  User({this.id,this.email, this.permissionLevel, this.name,this.userImageURL, this.password});

  User.fromMap(Map snapshot,String id) :
        id = id ?? '',
        email = snapshot['email'] ?? '',
        permissionLevel = snapshot['permissionLevel'] ?? '',
        name = snapshot['name'] ?? '',
        userImageURL = snapshot['userImageURL'] ?? '',
        password = snapshot['password'] ?? '';

  toJson() {
    return {
      "email": email,
      "permissionLevel": permissionLevel,
      "password": password,
      "name": name,
      "userImageURL": userImageURL,
    };
  }
}
