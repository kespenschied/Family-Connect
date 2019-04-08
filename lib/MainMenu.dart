import 'package:flutter/material.dart';

////////////////////
//MainMenu Buttons//
////////////////////
class MainMenuButtons extends StatefulWidget{
  @override
  State<StatefulWidget> createState() { 
    return _MainMenuButtonsState();
  }

}

//ok i want a column that has a row at each iteration
class _MainMenuButtonsState extends State<MainMenuButtons>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new Column(
      children: <Widget>[
        new Row(children: <Widget>[
          ButtonTheme(
            minWidth: 100.00,
            height: 100.0,
          child:RaisedButton(
           padding: const EdgeInsets.all(8.0),
          onPressed: () {},
          child: const Text('Christmas List'),
        )
        ),
        RaisedButton(
          onPressed: () {},
          child: const Text('Boop2'),
        ),
        RaisedButton(
          onPressed: () {},
          child: const Text('Boop3'),
        )
        ])
      ],
    )) ;
  }
}