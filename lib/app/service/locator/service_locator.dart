import 'package:get_it/get_it.dart';

import '../../../view_model/login_view_model.dart';
import '../../../view_model/main_view_model.dart';
import '../../../view_model/program_list_view_model.dart';
import '../../../view_model/user_view_model.dart';
import '../network_checker/network_checker_service.dart';

final GetIt locator = GetIt.instance;

// Service Locator
void setupServiceLocator() {
  // locator.registerLazySingleton(() => GqlClient());
  locator.registerLazySingleton(() => NetworkCheckerService());
  locator.registerLazySingleton(() => MainViewModel());
  locator.registerLazySingleton(() => UserViewModel());
  locator.registerLazySingleton(() => ProgramListViewModel());
  locator.registerFactory(() => LoginViewModel());
}