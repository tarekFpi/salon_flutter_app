import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';

class ServiceController extends GetxController {
  RxList<String> tabNamelist =
      <String>[AppStrings.services, AppStrings.schedule, AppStrings.profile].obs;

  RxInt currentIndex = 0.obs;
}