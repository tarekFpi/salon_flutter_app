// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/login_screen/inner_widget/login_popup.dart';
class LoginController extends GetxController {
  RxBool firstValue = false.obs;

  ///============ Show Family Dailog PopUp===============================
  showPopup() {
    return showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          content: LoginPopup(),
        ));
  }
}