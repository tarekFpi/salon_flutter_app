import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';

class SalonConfirmSchedule extends GetxController {
  final UserHomeController userHomeController = Get.find<UserHomeController>();

  Rx<DateTime> selectedDay = DateTime.now().obs;

  RxString dayName = ''.obs; 
  RxString timeSlot = ''.obs; 
 // Rx<DateTime> dateTime = DateTime.now().obs;


  void getWeekDayName(DateTime date) {   
    selectedDay.value = date;
    List dayNames = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    dayName.value = dayNames[date.weekday % 7];

    refresh(); 
    //========================= Call is Open Outlet Method =====================
    isOpenOoutLet();
    debugPrint('=============== Day Name: ${dayName.value} ===============');
  } 


  RxBool isOpen = false.obs; 

  isOpenOoutLet() {
    List<String> dayNameList = [];

    if (userHomeController.sheduleResponse.value.daySlot != null &&
        userHomeController.sheduleResponse.value.daySlot!.isNotEmpty) {
      for (int i = 0;
          i < userHomeController.sheduleResponse.value.daySlot!.length;
          i++) {
        dayNameList
            .add(userHomeController.sheduleResponse.value.daySlot![i].dayName!);
      }
    }

    isOpen.value = dayNameList.contains(dayName.value);
    refresh();

    debugPrint('=============== is Open : ${isOpen.value} ===============');
  } 

  bool isCurrentOrFutureDate(DateTime dateTime) {
  DateTime now = DateTime.now();
  // Compare the input DateTime with the current DateTime
  return dateTime.isAtSameMomentAs(now) || dateTime.isAfter(now);
}


  @override
  void onInit() {
    super.onInit();
    getWeekDayName(DateTime.now());
  }
}
