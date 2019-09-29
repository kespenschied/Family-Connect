//This page will be the page that opens when the user presses the floating
//action button in 'books.dart' allowing the user to scan in a new book to the list


import 'package:flutter/material.dart';

class BookscanningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scan Book"),
        backgroundColor: Colors.black,
      ),
      body: Center(
      ),
    );
  }
}