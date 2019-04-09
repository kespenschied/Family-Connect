import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './FirstPage.dart' as first;
import './MainMenu.dart';

//void main() => runApp(new MaterialApp(home: new ChoreChart()));

void main() => runApp(ChoreChart());

class ChoreChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _ChoreChartState();
  }
}

class _ChoreChartState extends State<ChoreChart> {

@override
  Widget build(BuildContext context) {
    // TODO: implement build

//changes from vertical view to horizontal(landscape mode)
SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);

    return MaterialApp(
      theme: ThemeData(
       brightness: Brightness.light,
        primarySwatch: Colors.green,
        accentColor: Colors.yellowAccent
    ),
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('ChoreChart'),
      ),
      body: Column(children: <Widget>[ //this column be made up of several rows, where each row will have several containers
        Row( children: <Widget>[

          Card(child:Container(

            margin: const EdgeInsets.all(20.0),

           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Chores',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),
          new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Mon',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),
        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Tue',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),
        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Wed',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),
        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Thur',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),

        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Fri',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),

        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Sat',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),

        new Flexible(
          child:Padding(
              padding: const EdgeInsets.all(8.0),
           child:Text(
              'Sun',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                background: Paint()..color = Colors.white12,
              ),
            ),
           ),
        ),
        ],

        ), //Chores, and Days of week end here

        //start a new row

        Row( children: <Widget>[
          Card(child:Container(

            margin: const EdgeInsets.all(20.0),
           // width: 40.0,

           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Trash',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),

          Card(
            child: Icon(Icons.star, size: 40)
          ) 
        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(20.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Dishes',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),
        ],

        )
      ],),
    )
    );
  }


}




  //TabController controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //controller = new TabController(vsync: this, length: 3);
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   //controller.dispose();
  //   super.dispose();
  // }




//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Favourites"),
//         backgroundColor: Colors.green,
//         bottom: new TabBar(
//           controller: controller,
//           tabs: <Tab>[
//             new Tab(icon: Icon(Icons.home)),
//             new Tab(icon: Icon(Icons.looks_one)),
//             new Tab(icon: Icon(Icons.looks_two))
//           ],
//         ),
//       ),
//       body: MainMenuButtons(),
//     );
//   }
// }







