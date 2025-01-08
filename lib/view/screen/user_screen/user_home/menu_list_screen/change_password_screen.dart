// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.changePassword),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Column(
          children: [
            ///================== Old password ===================//
            CustomFormCard(
              isPassword: true,
                title: AppStrings.oldPassword, controller: TextEditingController()),
            ///================== New password ===================//
            CustomFormCard(
                isPassword: true,
                title: AppStrings.newPassword, controller: TextEditingController()),
            ///================== confirm Password===================//
            CustomFormCard(
                isPassword: true,
                title: AppStrings.confirmPassword, controller: TextEditingController()),

            SizedBox(height: 50.h,),
            CustomButton(onTap: (){},title: AppStrings.changePassword,height: 50,fontSize: 16,)
          ],
        ),
      ),
    );
  }
}
