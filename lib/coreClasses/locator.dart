import 'package:family_connect/Utilities/UserCRUD.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'api.dart';
import 'package:family_connect/drawer.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('Users'));
  locator.registerLazySingleton(() => UserCRUD());
}