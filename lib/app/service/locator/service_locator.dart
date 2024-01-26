import 'package:get_it/get_it.dart';

import '../../../view_model/account_view_model.dart';
import '../../../view_model/address_view_model.dart';
import '../../../view_model/checkout_view_model.dart';
import '../../../view_model/dashboard_view_model.dart';
import '../../../view_model/edit_profile_view_model.dart';
import '../../../view_model/hotel_picker_view_model.dart';
import '../../../view_model/login_view_model.dart';
import '../../../view_model/main_view_model.dart';
import '../../../view_model/marketing_list_view_model.dart';
import '../../../view_model/member_list_view_model.dart';
import '../../../view_model/program_list_view_model.dart';
import '../../../view_model/register_view_model.dart';
import '../../../view_model/reward_list_view_model.dart';
import '../../../view_model/school_list_view_model.dart';
import '../../../view_model/student_reg_view_model.dart';
import '../../../view_model/user_view_model.dart';
import '../network_checker/network_checker_service.dart';

final GetIt locator = GetIt.instance;

// Service Locator
void setupServiceLocator() {
  locator.registerLazySingleton(() => NetworkCheckerService());
  locator.registerLazySingleton(() => MainViewModel());
  locator.registerLazySingleton(() => UserViewModel());
  locator.registerLazySingleton(() => RegisterViewModel());
  locator.registerLazySingleton(() => EditProfileViewModel());
  locator.registerLazySingleton(() => ProgramListViewModel());
  locator.registerLazySingleton(() => RewardListViewModel());
  locator.registerLazySingleton(() => MemberListViewModel());
  locator.registerLazySingleton(() => AddressViewModel());
  locator.registerLazySingleton(() => AccountViewModel());
  locator.registerLazySingleton(() => DashboardViewModel());
  locator.registerLazySingleton(() => StudentRegViewModel());
  locator.registerLazySingleton(() => SchoolListViewModel());
  locator.registerLazySingleton(() => HotelPickerViewModel());
  locator.registerLazySingleton(() => MarketingListViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => CheckoutViewModel());
}
