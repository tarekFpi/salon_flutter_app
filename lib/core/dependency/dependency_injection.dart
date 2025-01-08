import 'package:get/get.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/chat_controller/chat_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/salon_confirm_schedule/controller/salon_confirm_schedule_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/service_controller/service_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/login_screen/inner_widget/login_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/user_auth_controller/user_auth_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_service_controller/home_service_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/privacy_policy_screen/privacy_controller/privacy_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_controller/profile_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/servies_map_screen/services_map_controller/services_map_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/style_list_controller/style_list_controller.dart';

import '../../view/components/custom_image_add_send/custom_image_add_send_controller.dart';
import '../../view/screen/salon_screen/salon_profile/salon_profile_controller.dart';
import '../../view/screen/user_screen/user_home/offers_screen/offers_controller/offers_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================CustomController section==================
    Get.lazyPut(() => CustomImageAddSendController(), fenix: true);

    ///==========================User section==================
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => UserHomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => ServiceController(), fenix: true);
    Get.lazyPut(() => StyleListController(), fenix: true);
    Get.lazyPut(() => UserAuthController(), fenix: true);
    Get.lazyPut(() => HomeServiceController(), fenix: true);
    Get.lazyPut(() => ServicesMapController(), fenix: true);
    Get.lazyPut(() => PrivacyController(), fenix: true);
    Get.lazyPut(() => SalonProfileController(), fenix: true);
    Get.lazyPut(() => OffersController(), fenix: true);
    Get.lazyPut(() => SalonConfirmSchedule(), fenix: true);
  }
}
