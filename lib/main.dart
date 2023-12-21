import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/services/graphql_service.dart';

import 'app/locale/app_locale.dart';
import 'app/route/app_routes.dart';
import 'app/service/auth/auth_service.dart';
import 'app/service/locator/service_locator.dart';
import 'app/service/network_checker/network_checker_service.dart';
import 'app/theme/app_theme.dart';
import 'view/main/main_view.dart';
import 'view_model/account_view_model.dart';
import 'view_model/address_view_model.dart';
import 'view_model/checkout_view_model.dart';
import 'view_model/dashboard_view_model.dart';
import 'view_model/edit_profile_view_model.dart';
import 'view_model/hotel_picker_view_model.dart';
import 'view_model/login_view_model.dart';
import 'view_model/main_view_model.dart';
import 'view_model/member_list_view_model.dart';
import 'view_model/program_list_view_model.dart';
import 'view_model/register_view_model.dart';
import 'view_model/school_list_view_model.dart';
import 'view_model/student_reg_view_model.dart';
import 'view_model/user_view_model.dart';

Future<void> main() async {
  // Initialize binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  initializeDateFormatting();

  // Setup service locator
  setupServiceLocator();

  // Initialize Firebase (google-service.json required)
  // await Firebase.initializeApp();

  // Initialize FCM service (google-service.json required)
  // await FcmService.initNotification();

  // Initialize local notification service
  // await LocalNotifService.initLocalNotifService();

  // Initialize GraphQLService
  GraphQLService.init(getToken: AuthService.getToken);

  // Set/lock orientationgvhvgj
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Set overlay style
  SystemChrome.setSystemUIOverlayStyle(AppTheme.lightOverlayStyle);

  // runApp()
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Providers
        ChangeNotifierProvider(create: (_) => locator<NetworkCheckerService>()),
        ChangeNotifierProvider(create: (_) => locator<MainViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<LoginViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<RegisterViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<UserViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<EditProfileViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProgramListViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<MemberListViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<AddressViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<AccountViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<DashboardViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<StudentRegViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<SchoolListViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<HotelPickerViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CheckoutViewModel>()),
      ],
      child: MaterialApp(
        title: 'SatuJuta',
        theme: AppTheme.getTheme(),
        debugShowCheckedModeBanner: true,
        initialRoute: MainView.routeName,
        routes: AppRoutes.routes,
        // home: const CheckoutView(),
        locale: AppLocale.defaultLocale,
        supportedLocales: AppLocale.supportedLocales,
        localizationsDelegates: AppLocale.localizationsDelegates,
      ),
    );
  }
}
