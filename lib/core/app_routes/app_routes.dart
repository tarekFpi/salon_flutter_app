// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_earning/salon_earning_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_home_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_qr_screen/salon_OrderHistory_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_qr_screen/salon_qr_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_reviews/salon_reviews_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/salon_time_schedule_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_service/salon_service_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/translation_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/chat_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/inner_widget/message_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_authentication/account_ready_page/account_ready_page.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_authentication/sign_up_salon_screen/sign_up_salon_screen.dart';
import 'package:salon_booking_app/view/screen/spalash_screen/spalash_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/massage_list_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/start_chat_screen/start_chat_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/service_details_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/reset_password_screen/reset_password_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/sing_up_screen/sing_up_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/sing_up_send_code/sing_up_send_code.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/verify_email_screen/verify_email_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_services_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/about_us_screen/about_us_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/change_password_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/refer_friends_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/refer_list_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/setting_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/wishlist_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/notification_screen/notification_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/offers_screen/book_payment_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/offers_screen/offers_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/popular_services_screen/popular_services_details_screen/popular_services_details_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/popular_services_screen/popular_services_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/salon_confirm_schedule/salon_confirm_schedule_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/servies_map_screen/servies_map_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_page.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/service_map_style_list.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/style_list_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/user_service_screen.dart';
import '../../view/screen/salon_screen/salon_profile/salon_editProfile_screen.dart';
import '../../view/screen/salon_screen/salon_profile/salon_profile_screen.dart';
import '../../view/screen/user_screen/user_authentication/login_screen/login_screen.dart';

class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String translationScreen = "/TranslationScreen";
  static const String loginScreen = "/LoginScreen";
  static const String singUpScreen = "/SingUpScreen";
  static const String singUpSendCode = "/SingUpSendCode";
  static const String verifyEmailScreen = "/VerifyEmailScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String signUpSalonScreen = "/SignUpSalonScreen";
  static const String accountReadyPage = "/AccountReadyPage";
  static const String userHomePage = "/UserHomePage";
  static const String notificationScreen = "/NotificationScreen";
  static const String profileScreen = "/ProfileScreen";
  static const String editProfileScreen = "/EditProfileScreen";
  static const String chatScreen = "/ChatScreen";
  static const String messageScreen = "/MessageScreen";
  static const String massageListScreen = "/MassageListScreen";
  static const String serviceDetailsScreen = "/ServiceDetailsScreen";
  static const String popularServicesScreen = "/PopularServicesScreen";
  static const String homeServicesScreen = "/HomeServicesScreen";
  static const String offersScreen = "/OffersScreen";
  static const String serviesMapScreen = "/ServiesMapScreen";
  static const String styleListScreen = "/StyleListScreen";
  static const String wishlistScreen = "/WishlistScreen";
  static const String salonEarningScreen = "/SalonEarningScreen";
  static const String settingScreen = "/SettingScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String referFriendsScreen = "/ReferFriendsScreen";
  static const String userServiceScreen = "/UserServiceScreen";

  ///===========================Mehedi ==========================
  static const String referListScreen = "/ReferListScreen";
  static const String aboutUsScreen = "/AboutUsScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String termsConditionsScreen = "/TermsConditionsScreen";
  static const String bookPaymentScreen = "/BookPaymentScreen";
  static const String startChatScreen = "/StartChatScreen";
  static const String salonConfirmScheduleScreen =
      "/SalonConfirmScheduleScreen";

  ///===========================Authentication==========================

  //==================== Salon Routes ====================
  static const String salonOrderHistory = "/SalonOrderHistory";

  static const String salonHomeScreen = "/HomeScreen";
  static const String salonProfileEditScreen = "/SalonEditprofileScreen";
  static const String salonProfileScreen = "/SalonProfileScreen";
  static const String salonServiceScreen = "/SalonServiceScreen";
  static const String salonTimeScheduleScreen = "/SalonTimeScheduleScreen";
  static const String salonReviewsScreen = "/SalonReviewsScreen";
  static const String serviceMapStyleList = "/ServiceMapStyleList";
  static const String salonQrScreen = "/SalonQrScreen";
  static const String popularServiceDetailsScreen = "/PopularServiceDetailsScreen";

  static List<GetPage> routes = [
    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: translationScreen, page: () => TranslationScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: singUpScreen, page: () => SingUpScreen()),
    GetPage(name: singUpSendCode, page: () => SingUpSendCode()),
    GetPage(name: verifyEmailScreen, page: () => VerifyEmailScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: signUpSalonScreen, page: () => SignUpSalonScreen()),
    GetPage(name: accountReadyPage, page: () => AccountReadyPage()),
    GetPage(name: userHomePage, page: () => UserHomePage()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: massageListScreen, page: () => MassageListScreen()),
    GetPage(name: serviceDetailsScreen, page: () => ServiceDetailsScreen()),
    GetPage(name: popularServicesScreen, page: () => PopularServicesScreen()),
    GetPage(name: homeServicesScreen, page: () => HomeServicesScreen()),
    GetPage(name: offersScreen, page: () => OffersScreen()),
    GetPage(name: serviesMapScreen, page: () => ServiesMapScreen()),
    GetPage(name: styleListScreen, page: () => StyleListScreen()),
    GetPage(name: wishlistScreen, page: () => WishlistScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: referFriendsScreen, page: () => ReferFriendsScreen()),
    GetPage(name: userServiceScreen, page: () => UserServiceScreen()),
    GetPage(name: salonQrScreen, page: () => SalonQrScreen()),

    ///===========================Mehedi ==========================
    GetPage(name: referListScreen, page: () => ReferListScreen()),
    GetPage(name: aboutUsScreen, page: () => AboutUsScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: termsConditionsScreen, page: () => TermsConditionsScreen()),
    GetPage(name: bookPaymentScreen, page: () => BookPaymentScreen()),
    GetPage(name: startChatScreen, page: () => StartChatScreen()),
    GetPage(
        name: salonConfirmScheduleScreen,
        page: () => SalonConfirmScheduleScreen()),

    ///==================== Salon Routes ====================
    GetPage(name: salonHomeScreen, page: () => SalonHomeScreen()),
    GetPage(name: salonEarningScreen, page: () => SalonEarningScreen()),
    GetPage(name: salonProfileScreen, page: () => SalonProfileScreen()),
    GetPage(name: salonServiceScreen, page: () => SalonServiceScreen()),
    GetPage(
        name: salonTimeScheduleScreen, page: () => SalonTimeScheduleScreen()),
    GetPage(name: salonReviewsScreen, page: () => SalonReviewsScreen()),

    ///==================== Salon Routes ====================
    GetPage(name: salonHomeScreen, page: () => SalonHomeScreen()),
    GetPage(name: salonEarningScreen, page: () => SalonEarningScreen()),
    GetPage(name: salonProfileScreen, page: () => SalonProfileScreen()),
    GetPage(name: salonServiceScreen, page: () => SalonServiceScreen()),
    GetPage(
        name: salonTimeScheduleScreen, page: () => SalonTimeScheduleScreen()),
    GetPage(name: salonReviewsScreen, page: () => SalonReviewsScreen()),
    GetPage(name: salonOrderHistory, page: () => SalonOrderHistory()),
    GetPage(name: salonProfileEditScreen, page: () => SalonEditprofileScreen()),
    GetPage(name: serviceMapStyleList, page: () => ServiceMapStyleList()),
    GetPage(name: popularServiceDetailsScreen, page: () => PopularServiceDetailsScreen()),
  ];
}
