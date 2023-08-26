import 'package:flutter/material.dart';

import '../../view/checkout/checkout_view.dart';
import '../../view/checkout/student_checkout_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/hotel_picker/hotel_picker_view.dart';
import '../../view/hotel_picker/student_hotel_picker_view.dart';
import '../../view/login/login_view.dart';
import '../../view/login/reset_pass_view.dart';
import '../../view/main/main_view.dart';
import '../../view/marketing/marketing_gallery_screen.dart';
import '../../view/onboarding/onboarding_view.dart';
import '../../view/payment_status/payment_status.dart';
import '../../view/program_list/program_list_view.dart';
import '../../view/referral/referral_invitation_view.dart';
import '../../view/referral/referral_list_view.dart';
import '../../view/register/register_view.dart';
import '../../view/reward_list/reward_list_view.dart';
import '../../view/settings/about_view.dart';
import '../../view/settings/edit_password_view.dart';
import '../../view/settings/edit_profile_view.dart';
import '../../view/settings/settings_view.dart';
import '../../view/splash/splash_view.dart';
import '../../view/student/component/student_reg_status.dart';
import '../../view/student/student_registration_view.dart';
import '../../view/user/user_view.dart';
import '../../view/web_view/web_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.routeName: (context) => const SplashView(),
    MainView.routeName: (context) => const MainView(),
    LoginView.routeName: (context) => const LoginView(),
    ResetPassView.routeName: (context) => const ResetPassView(),
    RegisterView.routeName: (context) => const RegisterView(),
    DashboardView.routeName: (context) => const DashboardView(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    HotelPicker.routeName: (context) => const HotelPicker(),
    CheckoutView.routeName: (context) => const CheckoutView(),
    ProgramListView.routeName: (context) => const ProgramListView(),
    RewardListView.routeName: (context) => const RewardListView(),
    PaymentStatusView.successRouteName: (context) => const PaymentStatusView.success(),
    PaymentStatusView.failedRouteName: (context) => const PaymentStatusView.failed(),
    ReferralListView.viewAsMeRouteName: (context) => const ReferralListView.viewAsMe(),
    ReferralListView.viewAsOtherRouteName: (context) => const ReferralListView.viewAsOther(),
    ReferralInvitationView.viewAsMeRouteName: (context) => const ReferralInvitationView.viewAsMe(),
    UserView.viewAsMeRouteName: (context) => const UserView.viewAsMe(),
    SettingsView.routeName: (context) => const SettingsView(),
    EditProfileView.routeName: (context) => const EditProfileView(),
    EditPasswordView.routeName: (context) => const EditPasswordView(),
    MarketingGalleryView.routeName: (context) => const MarketingGalleryView(),
    StudentRegistrationView.routeName: (context) => const StudentRegistrationView(),
    StudentRegStatus.routeName: (context) => const StudentRegStatus(),
    StudentHotelPickerView.routeName: (context) => const StudentHotelPickerView(),
    StudentCheckoutView.routeName: (context) => const StudentCheckoutView(),
    AboutView.routeName: (context) => const AboutView(),
    WebView.routeName: (context) => const WebView(),
  };
}
