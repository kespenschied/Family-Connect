//This page/widget is the user select we currently have at the top of a few pages.
//This will be used throughout the app for user selection.

import 'package:family_connect/permissions.dart';
import 'package:flutter/material.dart';

import 'coreClasses/UserModel.dart';

class UserDrawer extends StatefulWidget {
  UserDrawer({
    Key key,
    @required this.userIDLoggedIn,
    @required this.userDocuments
  }):super(key: key);
  final String userIDLoggedIn;
  final List<User> userDocuments;

  @override
  State<StatefulWidget> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentUser = "";
  String currSelectedUserID = "";
  int num = 1; //color counter

  //String _currImageURL = "";
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentUser = getCurrUser(widget.userDocuments, widget.userIDLoggedIn);
    super.initState();
  }
void changedDropDownItem(String selectedUser) {
    setState(() {
      _currentUser = selectedUser;
      currSelectedUserID = getCurrUserID(widget.userDocuments, _currentUser);
      PermissionsPage(currAccountIDSelected: currSelectedUserID);
    });
  }
  String getCurrUser(List<User> userDocuments, String _profileID){
      String tempCurrUser = "";
        for (User profile in userDocuments) {
                       if(profile.id ==  _profileID){
                         tempCurrUser = profile.name; 
                         //_currImageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
                     return tempCurrUser;
}

String getCurrUserID(List<User> userDocuments, String _currentUserName){
      String tempCurrUserID = "";
        for (User profile in userDocuments) {
                       if(profile.name ==  _currentUserName){
                         tempCurrUserID = profile.id; 
                         //_currImageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
                     return tempCurrUserID;
}
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (User profile in widget.userDocuments) {
      items.add(DropdownMenuItem(
        value: profile.name,
        child: Container(
          color: _userColor(num),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: (new NetworkImage(Uri.decodeFull(profile.userImageURL.toString()))),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              profile.name,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 25.0),
            ),
            dense: true,
          ),
        ),
      ));
      num = num + 1;
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _userColor(num),
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            child: DropdownButton(
              iconEnabledColor: Colors.black,
              value: _currentUser,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }

  

  Color _userColor(int num) {
     
    switch (num) {
      case 1:
        {

          return Colors.blue;
        }
        break;
      case 2:
        {
          return Colors.green;
        }
        break;
      case 3:
        {
          return Colors.orange;
        }
        break;
      case 4:
        {
          return Colors.pink[200];
        }
        break;
        case 5:
        {
          return Colors.blue;
        }
        case 6:
        {
         return Colors.green;
        }
        case 7:
        {
          return Colors.orange;
        }
        case 8:
        {
          return Colors.pink[200];
        }
        case 9:
        {
          return Colors.blue;
        }
        case 10:
        {
           return Colors.green;
        }
        
      default:
        {
          return Colors.white;
        }
    }
  }

  AssetImage _userPicture(String username) {
    switch (username) {
      case "Connie":
        {
          return AssetImage('assets/pictures/connie.jpg');
        }
        break;
      case "David":
        {
          return AssetImage('assets/pictures/youngboy.png');
        }
        break;
      case "Josh":
        {
          return AssetImage('assets/pictures/collegekid.jpg');
        }
        break;
      case "Katie":
        {
          return AssetImage('assets/pictures/daughter.jpg');
        }
        break;
      default:
        {
          return AssetImage('assets/pictures/error.png');
        }
    }
  }
}
