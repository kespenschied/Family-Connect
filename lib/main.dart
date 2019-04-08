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
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        
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
          // Column(
          //   children: <Widget>[
            Row(
              children: <Widget>[
                // Padding(   
                //   padding: EdgeInsets.fromLTRB(50, 20, 15, 20),
                //   child:
                //   Text('Chores', textScaleFactor: 1.5, textAlign: TextAlign.center,),
                //   ),
                  // Text('Achievements', textScaleFactor: 1.5, textAlign: TextAlign.center,),
                  
              ],
            ),
            Row(
              children: <Widget>[
                // Padding(
              
                //   padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                //   child:
                //   Text('Lists', textScaleFactor: 1.5, textAlign: TextAlign.center,),
                  
                // ),
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: 
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(10),
                          child:
                        // Padding(
                          // padding: EdgeInsets.all(40),
                          // child:
                            Text('Chores', textScaleFactor: 1.5, ),

                      // ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: 
                      RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(10),
                      color: Colors.lightBlueAccent,
                      child:
                      Text('Flat Button', textScaleFactor: 1.5,),
                    ),
                    ),
                    
                  ],)
              ],
            ),
        ],
    ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
