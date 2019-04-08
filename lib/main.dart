import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Connect',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, textAlign: TextAlign.center,),
      ),
      //This is our hamburger menu
      endDrawer: Drawer(
        child: 
          ListView(
            children: <Widget>[
              //Not filled out because making home page. Koles looks really good though
            ],
          ),
      ),
      body: 
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'Welcome to Family Connect, Connie!', textScaleFactor: 2, textAlign: TextAlign.center,
            ),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 20)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                          RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(2),
                          child:
                            Text('Achievements', textScaleFactor: 1.5, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 20)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                        RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(2),
                          color: Colors.lightBlueAccent,
                          child:
                          Text('Activities', textScaleFactor: 1.5,),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                          RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(2),
                          child:
                            Text('Accounts', textScaleFactor: 1.5, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MyBooks())
                          },
                          padding: EdgeInsets.all(2),
                          color: Colors.lightBlueAccent,
                          child:
                          Text('Books', textScaleFactor: 1.5,),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                          RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(2),
                          child:
                            Text('Calender', textScaleFactor: 1.5, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                        RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(2),
                          color: Colors.lightBlueAccent,
                          child:
                          Text('Events', textScaleFactor: 1.5,),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                          RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(2),
                          child:
                            Text('Homework', textScaleFactor: 1.5, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                        RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(2),
                          color: Colors.lightBlueAccent,
                          child:
                          Text('Journal', textScaleFactor: 1.5,),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                          RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(2),
                          child:
                            Text('List', textScaleFactor: 1.5, ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 50)),
                      child: 
                      ButtonTheme(
                        height: 50,
                        minWidth: (MediaQuery.of(context).size.width / 2) - 25,
                        child:
                        RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(2),
                          color: Colors.lightBlueAccent,
                          child:
                          Text('Reminders', textScaleFactor: 1.5,),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
        ],
    ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
