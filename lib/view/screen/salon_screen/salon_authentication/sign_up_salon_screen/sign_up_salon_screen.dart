// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
class SignUpSalonScreen extends StatelessWidget {
  const SignUpSalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///================== Welcome Back Text ===================//
              CustomText(
                text: AppStrings.singUpAsSalon,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.black_50,
                bottom: 10.h,
              ),
          
              ///================== Please Enter Your Personal Data Text ===================//
              CustomText(
                text: AppStrings.pleaseEnterYourPersonalData,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.neutral03,
                bottom: 40.h,
              ),
          
              ///================== salonName ===================//
              CustomFormCard(
                  hintText: AppStrings.enterYourName,
                  title: AppStrings.salonName,
                  controller: TextEditingController()),
          
              ///================== email ===================//
              CustomFormCard(
                  hintText: AppStrings.enterYourEmail,
                  title: AppStrings.email,
                  controller: TextEditingController()),
          
              ///================== salonLocation ===================//
              CustomFormCard(
                  hintText: AppStrings.enterYourlocation,
                  title: AppStrings.salonLocation,
                  controller: TextEditingController()),
          
              ///================== phoneNumber ===================//
              CustomFormCard(
                  hintText: AppStrings.enterYourPhone,
                  title: AppStrings.phoneNumber,
                  controller: TextEditingController()),
          
              ///================== idCard ===================//
              CustomFormCard(
                  hintText: AppStrings.browseImage,
                  title: AppStrings.idCard,
                  controller: TextEditingController()),

              ///================== password ===================//
              CustomFormCard(
                isPassword: true,
                  hintText: AppStrings.password,
                  title: AppStrings.password,
                  controller: TextEditingController()),

              ///================== password ===================//
              CustomFormCard(
                  isPassword: true,
                  hintText: AppStrings.password,
                  title: AppStrings.confirmPassword,
                  controller: TextEditingController()),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    ///================== Checkbox & Remember Me ===================//
                    children: [
                      Checkbox(value: true, onChanged: (value) {},activeColor: AppColors.primary,),
                      ///================== Remember Me Text ===================//
                      CustomText(
                        text: AppStrings.iAgree,
                        color: AppColors.black_50,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        text: AppStrings.privacyPolicy,
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
          
                ],
              ),
              SizedBox(height: 20.h,),
              ///================== Login Button ===================//
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.singUpSendCode);
              },title: AppStrings.logIn,),

              ///================== Have Any Account ===================//
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppStrings.haveAnyAccount,
                    color: AppColors.neutral03,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(width: 5.w,),
                  CustomText(
                    text: "SignUp",
                    color: AppColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
      ),
    );
  }
}
