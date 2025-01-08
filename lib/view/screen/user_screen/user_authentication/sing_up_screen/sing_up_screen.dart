// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/user_auth_controller/user_auth_controller.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});
  final UserAuthController userAuthController = Get.find<UserAuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: Form(
            key: formKey,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///================== Welcome Back Text ===================//
                  CustomText(
                    text: AppStrings.singUp,
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
        
                  ///================== fullName ===================//
                  CustomFormCard(
                    hintText: AppStrings.enterYourName,
                    title: AppStrings.fullName,
                    controller: userAuthController.fullNameController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
        
                  ///================== email ===================//
                  CustomFormCard(
                    hintText: AppStrings.enterYourEmail,
                    title: AppStrings.email,
                    controller: userAuthController.emailController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
        
                  ///================== phoneNumber ===================//
                  CustomFormCard(
                    hintText: AppStrings.enterYourPhone,
                    title: AppStrings.phoneNumber,
                    controller: userAuthController.phoneNumberController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
        
                  ///================== password ===================//
                  CustomFormCard(
                    hintText: AppStrings.password,
                    title: AppStrings.password,
                    isPassword: true,
                    controller: userAuthController.passwordController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
        
                  ///================== password ===================//
                  CustomFormCard(
                    hintText: AppStrings.confirmPassword,
                    title: AppStrings.confirmPassword,
                    isPassword: true,
                    controller:
                        userAuthController.confirmPasswordController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldCantBeEmpty;
                      } else if (value !=
                          userAuthController.passwordController.value.text) {
                        return AppStrings.passwordNotMatch;
                      }
                      return null;
                    },
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppColors.primary,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: AppStrings.iAgree,
                            color: AppColors.black_50,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: AppStrings.privacyPolicy,
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
        
                  ///================== Login Button ===================//
                userAuthController.userRegisterLoading.value
                    ? CustomLoader()
                    : CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        userAuthController.userRegister();
                      }
                    },
                    title: AppStrings.signUp,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
