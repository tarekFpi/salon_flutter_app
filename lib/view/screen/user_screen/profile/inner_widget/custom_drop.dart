/*
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home_screen/profile_screen/profile_controller/profile_controller.dart';
class CustomDrop extends StatelessWidget {
 //final ProfileController profileController = Get.find<ProfileController>();
  CustomDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      //width: 80.w,
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        //border: Border.all(color: AppColors.red_500, width: .7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      child: DropdownButton<String>(
        hint: CustomText(
            text: AppStrings.confirmPassword,
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w700),
        borderRadius: BorderRadius.circular(15),
        elevation: 2,
        dropdownColor: AppColors.white,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.black_50,
        ),
        iconSize: 25,
        underline: const SizedBox(),
        //isExpanded: true, // This makes the dropdown full-width
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        value: profileController.selectTime.value,
        onChanged: (String? newValue) {
          profileController.selectTime.value = newValue!;
        },
        items: profileController.selectItem.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: CustomText(
              text: item,
              color: AppColors.black_50,
              fontSize: 16.w,
              fontWeight: FontWeight.w500,
            ),
          );
        }).toList(),
      ),
    );
  }
}*/
