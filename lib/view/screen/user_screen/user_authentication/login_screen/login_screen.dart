// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/login_screen/inner_widget/login_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/user_auth_controller/user_auth_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginController loginController = Get.find<LoginController>();
  final UserAuthController userAuthController = Get.find<UserAuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80,bottom: 24),
          child: Form(
            key: formKey,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///================== Welcome Back Text ===================//
                  CustomText(
                    text: AppStrings.welcomeBack,
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
                    bottom: 80.h,
                  ),
        
                  ///================== Email ===================//
                  CustomFormCard(
                    hintText: AppStrings.enterYourEmail,
                    title: AppStrings.email,
                    controller: userAuthController.loginEmailController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.emailFieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
        
                  ///================== Password ===================//
                  CustomFormCard(
                    //hintText: AppStrings.password,
                    hintText: "password".tr,
                    isPassword: true,
                    title: AppStrings.password,
                    controller: userAuthController.loginPasswordController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.passwordFieldCantBeEmpty;
                      } else if (value.length < 8) {
                        return AppStrings.enterThe8Character;
                      }
                      return null;
                    },
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        ///================== Checkbox & Remember Me ===================//
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: AppColors.primary,
                          ),
        
                          ///================== Remember Me Text ===================//
                          CustomText(
                            text: AppStrings.rememberMe,
                            color: AppColors.black_50,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
        
                      ///================== Forgot Password Text ===================//
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.verifyEmailScreen);
                        },
                        child: CustomText(
                          text: AppStrings.forgotPassword,
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
        
                  ///================== Login Button ===================//
                  userAuthController.loginLoading.value
                      ? CustomLoader()
                      : CustomButton(
                          onTap: () {
                            //  Get.toNamed(AppRoutes.userHomePage);git
                            if (formKey.currentState!.validate()) {
                              userAuthController.userLogin();
                            }
        
                          },
                          title: AppStrings.logIn,
                        ),
        
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 1.h,
                        width: MediaQuery.sizeOf(context).width / 4,
                        color: AppColors.neutral03,
                      ),
                      CustomText(
                        text: AppStrings.orSignWith,
                        color: AppColors.black_50,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      Container(
                        height: 1.h,
                        width: MediaQuery.sizeOf(context).width / 4,
                        color: AppColors.neutral03,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
        
                  ///================== Social Login Buttons ===================//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.appleIconsvg,
                        width: 55,
                        height: 55,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      CustomImage(
                        imageSrc: AppIcons.googleIcon,
                        width: 55,
                        height: 55,
                      ),
                    ],
                  ),
        
                  SizedBox(
                    height: 30.h,
                  ),
        
                  ///================== Dont Have Account Text ===================//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.dontHaveAccount,
                        color: AppColors.black_50,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.singUpScreen);
                          // loginController.showPopup();
                        },
                        child: CustomText(
                          text: AppStrings.signUp,
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
