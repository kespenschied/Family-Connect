//By: Kole Espenschied
//April 8th, 2019

//***********************************************
//This class holds all the Homework Page widgets
//***********************************************


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './drawer.dart';

class HomeworkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeworkPage();
}

class _HomeworkPage extends State<HomeworkPage> {

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
}

//when done with the page set it to portrait mode
@override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Homework'),
        //backgroundColor: Colors.black,
      ),
      endDrawer: MyDrawer(),
        body: ListView(children: <Widget>[ //this column be made up of several rows, where each row will have several containers
        Row( children: <Widget>[

          Card(child:Container(
            margin: const EdgeInsets.all(30.0),

           child: SizedBox(
          //width: 80.0,
         // height: 20.0,
           child:Text(
              'Days',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                color: Colors.orange,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          ),
          ),
         HomeworkContainerTitle('Mon'),
         HomeworkContainerTitle('Tue'),
         HomeworkContainerTitle('Wed'),
         HomeworkContainerTitle('Thu'),
         HomeworkContainerTitle('Fri'),
         HomeworkContainerTitle('Sat'),
         HomeworkContainerTitle('Sun')
        
        ],

        ), //Chores, and Days of week end here

        //start a new row

        Row( children: <Widget>[
          Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,

           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Math',
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

          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Read',
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

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Sci',
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

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        ),

        Row( children: <Widget>[
         Card(child:Container(

            margin: const EdgeInsets.all(18.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'History',
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

         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
         StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),
          StarButtonIcon(Icons.star, 42, Colors.green),

        ],

        )
      ],),

    );
  }
}


class HomeworkContainerTitle extends StatelessWidget {

  final String titleText;

  //use 
  HomeworkContainerTitle(this.titleText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
          width: 50.0,
          height: 50.0,
           child:Card(
             child: Center(
           child:Text(
              titleText,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                color: Colors.green,
                //background: Paint()..color = Colors.white12,
              ),
            ),
           ),
          )
         );
  }
}

class StarButtonIcon extends StatelessWidget{

final IconData image;
final int size;
final Color color;

StarButtonIcon(this.image, this.size, this.color);


@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
              child: Icon(
                Icons.star, size: 42, color: Colors.green,)
          );
  }
}