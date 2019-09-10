import 'package:flutter/material.dart';

class UserDrawer extends StatefulWidget {
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
    for (String user in _users) {
      items.add(DropdownMenuItem(
        value: user,
        child: Container(
          color: _userColor(user),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _userPicture(user),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              user,
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
      color: _userColor(_currentUser),
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

  Color _userColor(String username) {
    switch (username) {
      case "Connie":
        {
          return Colors.blue;
        }
        break;
      case "David":
        {
          return Colors.green;
        }
        break;
      case "Josh":
        {
          return Colors.orange;
        }
        break;
      case "Katie":
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
