//DB
//By: Sean Mathews
//October 13th, 2019

//*******************************************************************************
//This class holds all the references for all the User data passed from firebase
//*******************************************************************************

class Permissions {
  String id;
  bool achievements;
  bool books;
  bool calender;
  bool chores;
  bool homework;
  bool journal;
  bool lists;
  String email;
  String userLevel;


  Permissions({this.id,this.achievements,this.books, this.calender, this.chores,this.homework, this.journal, this.lists, this.email, this.userLevel});

  Permissions.fromMap(Map snapshot,String id) :
        id = id ?? '',
        achievements = snapshot['achievements'] ?? true,
        books = snapshot['books'] ?? true,
        calender = snapshot['calender'] ?? true,
        chores = snapshot['chores'] ?? true,
        homework = snapshot['homework'] ?? true,
        journal = snapshot['journal'] ?? true,
        lists = snapshot['lists'] ?? true,
        email = snapshot['email'] ?? '',
        userLevel = snapshot['userLevel'] ?? '';

  toJson() {
    return {
      "achievements": achievements,
      "books": books,
      "calender": calender,
      "journal": journal,
      "chores": chores,
      "homework": homework,
      "journal": journal,
      "lists": lists,
      "email": email,
      "userLevel": userLevel
    };
  }
}