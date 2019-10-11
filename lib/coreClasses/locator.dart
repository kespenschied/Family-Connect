import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:get_it/get_it.dart';
import 'api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('Users')); //path that leads to the collection, Users, on fireStore. will need a bunch of these for all the collections
  locator.registerLazySingleton(() => UserCRUD());
}