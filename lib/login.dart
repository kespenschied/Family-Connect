import 'package:flutter/material.dart';
import './home.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

//this will need to become stateful when doing functionality

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width - 10.0;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
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
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Text("LOGO HERE"),
              SizedBox(
                height: 100.0,
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
