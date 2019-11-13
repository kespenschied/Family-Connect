//DB
//By: Sean Mathews
//October 13th, 2019

//********************************************************************
//This file is used as the initital connection to the firebase DB, 
//which passes the Users collection to the file "userCRUD.dart" for 
//CRUD operations
//********************************************************************
import 'package:family_connect/Utilities/ChoreCRUD.dart';
import 'package:family_connect/Utilities/PermissionsCRUD.dart';
import 'package:family_connect/Utilities/PermissionsModelCRUDHome.dart';
import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:family_connect/Utilities/UserCRUDHome.dart';
import 'package:get_it/get_it.dart';
import 'api.dart';

GetIt locatorDrawer = GetIt();
GetIt permissionLocatorDrawer = GetIt();

GetIt locatorHome = GetIt();
GetIt choresLocatorHome = GetIt();
GetIt permissionLocatorHome = GetIt();

void setupLocator() {
  locatorDrawer.registerLazySingleton(() => Api('Users')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  locatorDrawer.registerLazySingleton(() => UserCRUD()); //this is for
  locatorHome.registerLazySingleton(() => Api('Users')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  locatorHome.registerLazySingleton(() => UserCRUDHome());
  permissionLocatorHome.registerLazySingleton(() => Api('User_Permissions')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  permissionLocatorHome.registerLazySingleton(() => PermissionCRUDHome());
  choresLocatorHome.registerLazySingleton(() => Api('Chores')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  choresLocatorHome.registerLazySingleton(() => ChoresCRUD());
}

void setupPermissionLocator() {
  permissionLocatorDrawer.registerLazySingleton(() => Api('User_Permissions')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  permissionLocatorDrawer.registerLazySingleton(() => PermissionCRUD());
}