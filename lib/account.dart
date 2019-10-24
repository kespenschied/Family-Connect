import 'dart:io';

import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'Utilities/UserCRUD.dart';
import 'coreClasses/UserModel.dart';

import 'dart:io';    
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore    
import 'package:flutter/material.dart';    
import 'package:image_picker/image_picker.dart'; // For Image Picker    
import 'package:path/path.dart' as Path; 

class AccountPage extends StatefulWidget {
 
  
  AccountPage({Key key, @required this.profileID, @required this.userDocuments}) : super(key: key); //how to pass values to other widgets
  final String profileID;
  final List<User> userDocuments;
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage>{
String _profileName = "";
String _imageURL = "";
String _profileEmail = "";

File _image;    
String _uploadedFileURL; 

@override
  void initState() {
    setUserValues(widget.userDocuments, widget.profileID);
        super.initState();
  }

  void setUserValues(List<User> userDocuments, String _profileID){
        for (User profile in userDocuments) {
                       if(profile.id ==  _profileID){
                         _profileEmail = profile.email;
                         _profileName = profile.name; 
                         _imageURL = Uri.decodeFull(profile.userImageURL.toString()); //gets the image from JSON and decodes the image's url in firebase into URI
                       }
                     }
  }



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
                    _updatePhoto(context, widget.profileID);
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
                    onTap:() {_updateName(context, widget.profileID);}, //Implement functionality of changing the user's name.
                    child: Center(
                      child: Text('Edit name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                    ),
                  )
                ),
              ),
              SizedBox(height: 25.0,),
              Text(_profileEmail, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                      _updateEmail(context, widget.profileID);
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
                    onTap:() {_updatePass(context, widget.profileID);}, //Implement functionality of changing the user's name.
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
        )
    );
  }

   _updateEmail(BuildContext context, String _profileID) async{
    
    TextEditingController _textFieldController = TextEditingController(); //object that has a method to get value

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    String newEmail = "";
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
        title: Text('Enter New Email'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                newEmail = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              user.updateEmail(newEmail).then((_){
                Firestore.instance.collection("Users").document(_profileID).updateData({'email' : newEmail}); //updates in database portion of firebase
                successfulupdate();
              }).catchError((){
                failedUpdate();
              }); //updates in Auth portion in firebase
              
              Navigator.of(context).pop(newEmail);
            }
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(newEmail);
            }
           ) 
           ],
      );
      }
    );
  }
   _updateName(BuildContext context, String _profileID) async {

      TextEditingController _textFieldController = TextEditingController(); //object that has a method to get value

    String newName = "";
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
        title: Text('Enter New Name'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                newName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Firestore.instance.collection("Users").document(_profileID).updateData({'name' : newName});
              Navigator.of(context).pop(newName);
            }
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(newName);
            }
           ) 
           ],
      );
      }
    );

  }
 _updatePhoto(BuildContext context, String _profileID) async{


   return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title:  Text('Pick a Photo'),
          content: StatefulBuilder(  // You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[    
           Text('Selected Image'),    
           _image != null    
               ? Image.asset(    
                   _image.path,    
                   height: 350,    
                 )    
               : Container(),    
           _image == null    
               ? RaisedButton(    
                   child: Text('Choose File'),    
                   onPressed: () async {
                     await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {    
                      setState(() { 
                      _image = image;    
                        }); 
                   });
                   },
                   color: Colors.cyan,    
                 )    
               : Container(),    
           _image != null    
               ? RaisedButton(    
                   child: Text('Upload File'),    
                   onPressed: uploadFile,    
                   color: Colors.cyan,    
                 )    
               : Container(),    
           _image != null    
               ? RaisedButton(    
                   child: Text('Clear Selection'),    
                   onPressed: () async {
                      setState(() { 
                      _image = null;    
                        }); 
                   },   
                 )    
               : Container(),    
           Text('Uploaded Image'),    
           _uploadedFileURL != null    
               ? Image.network(    
                   _uploadedFileURL,    
                   height: 150,    
                 )    
               : Container(),
               FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(_image);
            }
           )    
         ],    
          );
          }
          ),
        );
      }
   );
  }

  Future chooseFile() async{    
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {    
       setState(() { 
       _image = image;    
        });  
   }); 
 }

 Future uploadFile() async {    
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('Users/${Path.basename(_image.path)}}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
     setState(() {    
       _uploadedFileURL = fileURL;                      //widget.profileID gets the profileID passed from another class at the top of this page
        Firestore.instance.collection("Users").document(widget.profileID).updateData({'userImageURL' : _uploadedFileURL}); 
     });    
   });    
 }    
   _updatePass(BuildContext context, String _profileID) async{

      TextEditingController _textFieldController = TextEditingController(); //object that has a method to get value
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
      
    String newPassword = "";
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
        title: Text('Enter New Password'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
                  obscureText: true,
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                newPassword = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
               user.updatePassword(newPassword).then((_){
                Firestore.instance.collection("Users").document(_profileID).updateData({'password' : newPassword}); //updates in database portion of firebase
                successfulupdate();
              }).catchError((){
                failedUpdate();
              }); //updates in Auth portion in firebase
              Navigator.of(context).pop(newPassword);
            }
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(newPassword);
            }
           ) 
           ],
      );
      }
    );

  }

  //notification
  void successfulupdate() {
    DropdownBanner.showBanner(
      text: 'Successfully updated, logout to refresh changes',
      color: Colors.green,
      textStyle: TextStyle(color: Colors.white),
    );
  }

  void failedUpdate() {
    DropdownBanner.showBanner(
      text: 'Failed to update',
      color: Colors.red,
      textStyle: TextStyle(color: Colors.white),
    );
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