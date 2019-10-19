import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Utilities/UserCRUD.dart';
import 'coreClasses/UserModel.dart';

class AccountPage extends StatefulWidget {
 
  
  AccountPage({Key key, @required this.profileEmail, @required this.userProvider}) : super(key: key); //how to pass values to other widgets
  final String profileEmail;
  final userProvider;
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage>{

  

List<User> userDocuments;

String _profileName = "";
String _imageURL = "";
String _profileID = "";



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account"),
        backgroundColor: Colors.black,
      ),
      body: new Stack(
        children: <Widget>[
          Container(
        
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
        ),
        Container( //firebase starts here
            child: StreamBuilder( //a widget that fetches the database data from firestore
              stream: widget.userProvider.fetchUsersAsStream(), //helper function that gets all the users from the "Users" collection in firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //if(snapshot.data == null) return CircularProgressIndicator(); //shows a rotating circle while data is getting fetched
              if (snapshot.hasData) {
                userDocuments = snapshot.data.documents //gets all Users docs from firebase and is stored into a list
                    .map((doc) => User.fromMap(doc.data, doc.documentID)).toList();
                     for (User profile in userDocuments) {
                       if(profile.email == widget.profileEmail){
                         _profileID = profile.id;
                         _profileName = profile.name; 
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     } 
                     return ListView(
                     padding: const EdgeInsets.all(0.0),
                    children: <Widget>[             
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.height / 15,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter, //Aligns the text on top of photo.
                padding: const EdgeInsets.only(bottom: 25,), //Extra padding to put text more central
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: new DecorationImage(
                    image: new NetworkImage(_imageURL),
                    fit: BoxFit.fill,
                    
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)
                  ),
                  boxShadow: [BoxShadow(blurRadius: 5.0, color: Colors.black)]
                ),
                child: GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: 140.0,
                    height: 30.0,
                    alignment: Alignment.bottomCenter,
                    child: Text('Edit Photo', style: TextStyle(fontSize: 22, color: Colors.white),),
                  )
                )
              ),
              SizedBox(height: 20.0,), //Space between items.
              Text(_profileName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,), //Space between items.
              Container( // Create space for text
                height: 30.0,
                width: 95.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {}, //Implement functionality of changing the user's name.
                    child: Center(
                      child: Text('Edit name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
              SizedBox(height: 25.0,),
              Text(widget.profileEmail, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: 15.0,),
              Container(
                height: 30.0,
                width: 95.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {
                      _updateEmail(context, _profileID);
                    }, //Implement functionality of changing the user's name.
                    child: Center(
                      child: Text('Edit email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
              SizedBox(height: 60.0,),
              Container(
                height: 30.0,
                width: 160.0,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  shadowColor: Colors.black,
                  color: Colors.white60,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap:() {}, //Implement functionality of changing the user's name.
                    child: Center(
                      child: Text('Change password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
            ],
          ),
        )
        ]
      );
      }
              else {
                return Text("fetching data");
              }
            }),
    )
        ]
        )
    );
  }

  void _updateEmail(BuildContext context, String _profileID) {
    
    String newEmail = "";
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Container(
          child: TextFormField(decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    labelText: 'Email',
                    filled: true,
                  ),
                  validator: (input) { 
                    if (!input.contains('@')) {
                    return 'Not A Valid Email';
                    }
                  },
                      onSaved: (input) => newEmail = input
          ),
        );
      }
    );

    Firestore.instance.collection("Users").document(_profileID)
        .updateData({'email' : newEmail});
  }
  void _updateName(BuildContext context) {

  }
  void _updatePhoto(BuildContext context) {

  }
  void _updatePass(BuildContext context) {

  }
}

// class ProfileImage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Container(
      
//       alignment: Alignment.bottomCenter,
//       padding: const EdgeInsets.only(bottom: 25,),
//       height: 150.0,
//       width: 150.0,
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         image: new DecorationImage(
//           image: AssetImage('assets/pictures/connie.jpg'),
//           fit: BoxFit.fill,
          
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(75.0)

//         ),
//       ),
//       child: Text('Edit Photo', style: TextStyle(fontSize: 22, color: Colors.white),),
      
//     );
//   }
// }

// class TextContainer extends StatelessWidget{ //Holds the text fields
//   final String _name;
//   final String _username;
//   final String _email;
//   final String _pw;
//   static const double _txtPadL = 75.0;

//   TextContainer(this._name, this._username, this._email, this._pw);

//   @override 
//   Widget build(BuildContext context){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
      
//       children: [
//         Container( // These text styles should be one single style to reduce redundancy.
//           alignment: AlignmentDirectional.center,
//           //padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
//           decoration: BoxDecoration(
//             color: Colors.white54,
//             borderRadius: BorderRadius.circular(25)
//           ),
//           child: Text(_name, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
//         ),
//         Container(
//           alignment: AlignmentDirectional.centerStart,
//           padding: const EdgeInsets.fromLTRB(_txtPadL, 20, 16.0, 16.0),
//           child: Text("Username: " + _username, style: TextStyle(fontSize: 24),),
//         ),
//         Container(
//           alignment: AlignmentDirectional.centerStart,
//           padding: const EdgeInsets.fromLTRB(_txtPadL, 40, 16.0, 16.0),
//           child: Text("Email: " + _email, style: TextStyle(fontSize: 24)),
//         ),
//         Container(
//           alignment: AlignmentDirectional.centerStart,
//           padding: const EdgeInsets.fromLTRB(_txtPadL, 40, 16.0, 16.0),
//           child: Text("Password: " + _pw, style: TextStyle(fontSize: 24)),
//         ),
//       ],
//     );
//   }
// }
