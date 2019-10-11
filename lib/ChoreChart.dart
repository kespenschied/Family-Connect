import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './FirstPage.dart' as first;
import './MainMenu.dart';
import './drawer.dart';

//void main() => runApp(new MaterialApp(home: new ChoreChart()));


class ChoresPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChoresPageManager();
}


class _ChoresPageManager extends State<ChoresPage> {

//at initalstate set it to landscape mode
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

//changes from vertical view to horizontal(landscape mode)


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('ChoreChart'),
      ), endDrawer: MyDrawer(),
      body: ListView(children: <Widget>[ //this column be made up of several rows, where each row will have several containers
        Row( children: <Widget>[

          Card(child:Container(
            margin: const EdgeInsets.all(30.0),

           child: SizedBox(
          //width: 80.0,
         // height: 20.0,
           child:Text(
              'Chores',
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
         ChoreContainerTitle('Mon'),
         ChoreContainerTitle('Tue'),
         ChoreContainerTitle('Wed'),
         ChoreContainerTitle('Thu'),
         ChoreContainerTitle('Fri'),
         ChoreContainerTitle('Sat'),
         ChoreContainerTitle('Sun')
        
        ],

        ), //Chores, and Days of week end here

        //start a new row

        Row( children: <Widget>[
          Card(child:Container(

            margin: const EdgeInsets.all(30.0),
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

            margin: const EdgeInsets.all(30.0),
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

            margin: const EdgeInsets.all(30.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'HW',
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

            margin: const EdgeInsets.all(30.0),
           // width: 40.0,
           child: SizedBox(
          width: 80.0,
          height: 20.0,
           child:Text(
              'Sweep',
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


class ChoreContainerTitle extends StatelessWidget {

  final String titleText;

  //use 
  ChoreContainerTitle(this.titleText);

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