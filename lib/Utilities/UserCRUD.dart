import 'package:flutter/material.dart';
import 'package:family_connect/Utilities/index.dart';

class UserCRUDPage extends StatelessWidget {
  static const String routeName = "/userCRUD";

  @override
  Widget build(BuildContext context) {
    var _userCRUDBloc = UserCRUDBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("UserCRUD"),
      ),
      body: UserCRUDScreen(userCRUDBloc: _userCRUDBloc),
    );
  }
}
