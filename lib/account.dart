import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.grey[400],
              Colors.grey[600],
              Colors.grey[500],
              Colors.grey[400],
            ],
          ),
        ),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileImage(),
            TextContainer("Connie Barber", "conniebarb27", "cobarabe@siue.edu"),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 10),
      constraints: BoxConstraints.expand(
        height: 150,
      ),
      child: Image.asset('assets/pictures/connie.jpg'),
    );
  }
}

class TextContainer extends StatelessWidget{ //Holds the text fields
  final String _name;
  final String _username;
  final String _email;
  static const double _txtPadL = 75.0;

  TextContainer(this._name, this._username, this._email);

  @override 
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: Text(_name),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
          child: Text("Edit Photo"),
        ),
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.fromLTRB(_txtPadL, 40, 16.0, 16.0),
          child: Text("Username: " + _username),
        ),
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.fromLTRB(_txtPadL, 40, 16.0, 16.0),
          child: Text("Email: " + _email),
        ),
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.fromLTRB(_txtPadL, 40, 16.0, 16.0),
          child: Text("Change Password"),
        ),
      ],
    );
  }
}
