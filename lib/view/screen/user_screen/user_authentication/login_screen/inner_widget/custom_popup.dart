// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomPopup extends StatelessWidget {
  final void Function()? onTap;
  const CustomPopup({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: AppStrings.hi,
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          bottom: 10.h,
        ),
        CustomText(
          text: AppStrings.pleaseSelectHowYou,
          color: AppColors.neutral03,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          bottom: 40.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 120.w,
              height: 45.h,
              onTap: () {
                Get.toNamed(AppRoutes.signUpSalonScreen);
              },
              title: AppStrings.professional,
              fillColor: AppColors.white,
              textColor: AppColors.primary,
              borderWidth: 1,isBorder: true,borderRadias: 10,
            ),
            CustomButton(
              height: 45.h,
              width: 120.w,
              onTap: () {
                Get.toNamed(AppRoutes.singUpScreen);
              },
              title: AppStrings.user,
            )
          ],
        )
      ],
    );
  }
}
