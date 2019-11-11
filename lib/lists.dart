//By: Kole Espenschied
//April 8th, 2019

//********************************************
//This class holds all the Lists Page widgets
//Im in the process of redesigning this page 9/17/19 -kole
//Will need a floating action button added to allow
//the user to add a new list to the screen.
//********************************************
import 'dart:io';
import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:family_connect/user_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Utilities/UserCRUD.dart';
import 'coreClasses/ListsModel.dart';
import 'coreClasses/UserModel.dart';
import 'package:flutter/material.dart';    
import 'package:path/path.dart' as Path; 

class ListsPage extends StatefulWidget {
  String profileEmail;
  final List<User> userDocuments;
  final listProvider;
  ListsPage({Key key, @required this.userDocuments, @required this.listProvider, @required this.profileEmail}) : super(key: key); //how to pass values to other widgets
  @override
  State<StatefulWidget> createState() => _ListsState();
}

class _ListsState extends State<ListsPage> {
  // String _profileName = "";
  String _profileID = "";
  String _profileName = "";
  String _imageURL = "";
  List<Lists> listDocuments;
  List<String> _listItemsDB;
  var isItChecked = List<bool>.generate(16, (i) => false);
  @override
  void initState() { 
    setUserValues(widget.userDocuments, widget.profileEmail);
        super.initState();
  }
  void setUserValues(List<User> userDocuments, String profileEmail){
        for (User profile in userDocuments) {
                       if(profile.email ==  profileEmail){
                         _profileID = profile.id;
                         _profileName = profile.name;
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
  }
  @override
  Widget build(BuildContext context) {
    Lists userList = new Lists();
    double width = MediaQuery.of(context).size.width;
    return  Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: (widget.listProvider).fetchListsAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                listDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => Lists.fromMap(doc.data, doc.documentID)).toList();
                     for (Lists profile in listDocuments) {
                       if(profile.email ==  widget.profileEmail){
                         userList.email = profile.email;
                         userList.listItems = profile.listItems;
                         userList.listName = profile.listName;
                       }
                     }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lists'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          //UserDrawer(key: userKey),
          //UserDrawer(),
          Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),                  
                  ),
                  //titleBar(Colors.green, (userKey.currentState != null) ? userKey.currentState.currentUser : "RELOAD", Icons.create),
                  titleBar(Colors.blue, userList.listName, Icons.add_shopping_cart),
                  listItems('\n' + userList.listItems[0],'', 0), ///Added newline characters to put the title in middle of card
                  listItems('\n' + userList.listItems[1], '',1),
                  listItems('\n' + userList.listItems[2],'', 2),
                  listItems('\n' + userList.listItems[3], '',3),
                  listItems('\n' + userList.listItems[4], '',4),
                  listItems('\n' + userList.listItems[5], '',5),
                  listItems('\n' + userList.listItems[6], '',6),
                  listItems('\n' + userList.listItems[7], '',7),

                  titleBar(Colors.grey, 'School Supplies', Icons.attach_file),
                  listItems('\nPencils', '',8),
                  listItems('\nPens', '',9),
                  listItems('\nBinders', '',10),
                  listItems('\nNotebooks', '',11),
                  listItems('\nLunch Box', '',12),
                  listItems('\nNew Laptop', '',13),
                  listItems('\nCalculator', '',14),
                  listItems('\nBooks', '',15),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
  else {
    return Text("Fetching data");
  }
            }),
    );
  }
  Widget titleBar(
      Color accountColor, String title, IconData listIcon) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Card(
        shape: BeveledRectangleBorder(),
        elevation: 15.0,
        color: accountColor,
        margin: EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(
            listIcon,
            size: 30.0,
            color: Colors.black,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget listItems(String listItem, String info, int index) {
    return Card(
      elevation: 15.0,
      margin: EdgeInsets.all(1),
      child: CheckboxListTile(
        activeColor: Colors.green,
        isThreeLine: false,
        title: Text(
          listItem,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        subtitle: Text(
          info,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        value: isItChecked[index],
        onChanged: (bool val) {
          setState(() {
            isItChecked[index] = val;
          });
        },
      ),
    );
  }

  // Widget drawBody(double width) {
  //   List<Widget> groceries = [rightCardTitleBar(width, Colors.blue,'Groceries', Icons.add_shopping_cart),
  //                             rightCardListItems(width, 'Milk', true),
  //                             rightCardListItems(width, 'Bread', true),
  //                             rightCardListItems(width, 'Tilapia', false),
  //                             rightCardListItems(width, 'Coca Cola', true),
  //                             rightCardListItems(width, 'Lunch Meat', false),
  //                             rightCardListItems(width, 'Lettuce', false),
  //                             rightCardListItems(width, 'Tomato', false),
  //                             rightCardListItems(width, 'Eggs', true)];

  //   List<Widget> school = [rightCardTitleBar(width, Colors.orange,'School Supplies', Icons.attach_file),
  //                             rightCardListItems(width, 'Pencils', true),
  //                             rightCardListItems(width, 'Pens', false),
  //                             rightCardListItems(width, 'Binders', true),
  //                             rightCardListItems(width, 'Notebooks', true),
  //                             rightCardListItems(width, 'Lunch Box', false),
  //                             rightCardListItems(width, 'New Laptop', false),
  //                             rightCardListItems(width, 'Calculator', false),
  //                             rightCardListItems(width, 'Books', true)];
    
  //   return ListView(
  //     children: <Widget>[
  //       //UserDrawer(),
  //       Center(
  //         child: Container(
  //           child: Column(
  //             children: <Widget>[
  //               Row(
  //                 children: <Widget>[
  //                   drawLeftCards(width, Colors.blue,'assets/pictures/connie.jpg', 'Connie', 'April 10th'),
  //                   drawRightCards(width, groceries),
  //                 ],
  //               ),
  //               Row(
  //                 children: <Widget>[
  //                   drawLeftCards(width, Colors.orange,'assets/pictures/collegekid.jpg', 'Josh', 'April 14th'),
  //                   drawRightCards(width, school),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget drawLeftCards(double width, Color accountColor, String image, String account, String date) {
  //   double leftCardWidth = width / 3;

  //   return Container(
  //     width: leftCardWidth,
  //     height: 360.0,
  //     child: Card(
  //       shape: BeveledRectangleBorder(),
  //       elevation: 5.0,
  //       margin: EdgeInsets.fromLTRB(2.0, 2.0, 0, 5.0),
  //       color: accountColor,
  //       child: Center(
  //         child: Column(
  //           children: <Widget>[
  //             Container(
  //               padding: EdgeInsets.only(
  //                 top: 30.0,
  //               ),
  //               child: CircleAvatar(
  //                 maxRadius: 60.0,
  //                 backgroundColor: Colors.white,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     image: DecorationImage(
  //                       image: AssetImage(image),
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.only(
  //                 bottom: 10.0,
  //               ),
  //               child: Text(
  //                 account,
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 25.0,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             Text(
  //               'Posted On:',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //                 decoration: TextDecoration.underline,
  //               ),
  //             ),
  //             Text(
  //               date,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   Widget drawRightCards(double width, List<Widget> widgetList) {
//     double rightCardWidth = width / 3 * 2;

//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//           left: BorderSide(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       width: rightCardWidth,
//       height: 360.0,
//       child: Card(
//         shape: BeveledRectangleBorder(),
//         elevation: 5.0,
//         margin: EdgeInsets.fromLTRB(0, 2.0, 2.0, 5.0),
//         color: Colors.white70,
//         child: ListView(
//           children: widgetList
//         ),
//       ),
//     );
//   }
// }

// Widget rightCardTitleBar(double rightCardWidth, Color accountColor, String title, IconData listIcon) {
//   return Container(
//     width: rightCardWidth,
//     height: 55.0,
//     decoration: BoxDecoration(
//       border: Border(
//         bottom: BorderSide(color: Colors.black),
//       ),
//     ),
//     child: Card(
//       shape: BeveledRectangleBorder(),
//       elevation: 5.0,
//       color: accountColor,
//       margin: EdgeInsets.all(0),
//       child: ListTile(
//         leading: Icon(
//           listIcon,
//           size: 30.0,
//           color: Colors.black,
//         ),
//         title: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         trailing: Icon(
//           Icons.more_vert,
//           size: 30.0,
//           color: Colors.black,
//         ),
//       ),
//     ),
//   );
// }

// Widget rightCardListItems(double rightCardWidth, String listItem, bool value) {
//   return Card(
//     elevation: 15.0,
//     margin: EdgeInsets.all(1),
//     child: CheckboxListTile(
//       activeColor: Colors.green,
//       title: Text(
//         listItem,
//         style: TextStyle(
//           fontSize: 20.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       value: value,
//       onChanged: (bool val) {},
//     ),
//   );
}
