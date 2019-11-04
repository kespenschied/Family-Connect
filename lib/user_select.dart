//This page/widget is the user select we currently have at the top of a few pages.
//This will be used throughout the app for user selection.

import 'package:flutter/material.dart';

import 'coreClasses/UserModel.dart';
import 'dart:math';

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
  List _users = ["Connie", "David", "Josh", "Katie"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentUser;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentUser = _dropDownMenuItems[0].value;
    super.initState();
  }


  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (User profile in widget.userDocuments) {
      items.add(DropdownMenuItem(
        value: profile.name,
        child: Container(
          color: _userColor(),
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
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _userColor(),
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

  void changedDropDownItem(String selectedUser) {
    setState(() {
      _currentUser = selectedUser;

    });
  }

  Color _userColor() {
      var rng = new Random();
     int num = rng.nextInt(4);
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
