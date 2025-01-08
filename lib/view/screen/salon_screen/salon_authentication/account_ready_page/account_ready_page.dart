// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class AccountReadyPage extends StatelessWidget {
  const AccountReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){Get.toNamed(AppRoutes.loginScreen);},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(imageSrc: AppIcons.icon1),
              CustomText(
                top: 20.h,
                text: AppStrings.yourAccountIsReady,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black_50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
