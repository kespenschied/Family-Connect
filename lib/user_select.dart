import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class UserDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  List _users = ["Connie", "David", "Josh", "Katie"];
  List _backgroundColors = [
    Colors.red,
    Colors.teal,
    Colors.brown,
    Colors.green,
    Colors.orange,
    Colors.purple
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentUser;
  Color _currentColor;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentUser = _dropDownMenuItems[0].value;
    _currentColor = _backgroundColors[randomBetween(0, 5)];
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String user in _users) {
      items.add(DropdownMenuItem(
        value: user,
        child: Container(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  randomAlpha(2).toUpperCase(), //randomly generate 2 letters
                  style: TextStyle(color: Colors.white),
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
      color: _currentColor,
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
      _currentColor = _backgroundColors[randomBetween(0, 5)];
    });
  }
}
