//October 13th, 2019

//********************************************************************
//This file is used as the initital connection to the firebase DB, 
//which passes the Users collection to the file "userCRUD.dart" for 
//CRUD operations
//********************************************************************
import 'package:family_connect/Utilities/PermissionsCRUD.dart';
import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:family_connect/Utilities/EventCRUD.dart';
import 'package:get_it/get_it.dart';
import 'api.dart';

GetIt locator = GetIt();

GetIt permissionLocator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('Users')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  locator.registerLazySingleton(() => UserCRUD());
}

void setupPermissionLocator() {
  permissionLocator.registerLazySingleton(() => Api('User_Permissions')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  permissionLocator.registerLazySingleton(() => PermissionCRUD());
}
