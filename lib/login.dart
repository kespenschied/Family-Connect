import 'package:flutter/material.dart';
import './home.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

//this will need to become stateful when doing functionality

class LoginPage extends StatelessWidget {
  //Styling for the 'Family Connect' Strings
  TextStyle _titleTextStyling() {
    return TextStyle(
      fontFamily: 'DancingScript',
      fontSize: 90.0,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.blue,
          blurRadius: 10.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width - 10.0;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pictures/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //sizedBox for Spacing
              Text(
                "Family",
                style: _titleTextStyling(),
              ),
              Text(
                "Connect",
                style: _titleTextStyling(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: fieldWidth,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    labelText: 'Username',
                    filled: true,
                  ),
                  validator: (input) =>
                      !input.contains('@') ? 'Not A Valid Email' : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Container(
                width: fieldWidth,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    labelText: 'Password',
                    filled: true,
                  ),
                  validator: (input) =>
                      !input.contains('@') ? 'Not A Valid Email' : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ButtonTheme(
                minWidth: 200.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  elevation: 5.0,
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              GoogleSignInButton(
                onPressed: () {},
                darkMode: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
