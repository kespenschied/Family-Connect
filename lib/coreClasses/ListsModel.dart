//DB
//By: Chris Blaylock
//November 9th, 2019

//*******************************************************************************
//This class holds all the references for all the User Lists data passed from firebase
//*******************************************************************************

class Lists {
  String id;
  String listName;
  List<String> listItems;
  String email;

  Lists({this.id,this.listName, this.listItems, this.email});

  Lists.fromMap(Map snapshot,String id) :
        id = id ?? '',
        listName = snapshot['listName'] ?? '',
        listItems = List.from(snapshot['listItems']),
        email = snapshot['email'] ?? '';
        // permissionLevel = snapshot['permissionLevel'] ?? '',
        // name = snapshot['name'] ?? '',
        // userImageURL = snapshot['userImageURL'] ?? '',
        // password = snapshot['password'] ?? '';

  toJson() {
    return {
      "listName": listName,
      "listItems": listItems,
      "email": email
      // "permissionLevel": permissionLevel,
      // "password": password,
      // "name": name,
      // "userImageURL": userImageURL,
    };
  }
}
