// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_pin_code/custom_pin_code.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_authentication/user_auth_controller/user_auth_controller.dart';

class SingUpSendCode extends StatelessWidget {
  SingUpSendCode({super.key});
 // final authController = Get.find<AuthController>();
  final UserAuthController userAuthController = Get.find<UserAuthController>();
  final UserModel userModel =Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Obx(
         () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.enterCode,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black_50,
                  bottom: 10.h,
                ),
                CustomText(
                  text: AppStrings.enterTheCodeTitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral03,
                  bottom: 30.h,
                ),
                CustomPinCode(controller: userAuthController.otpController.value),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppStrings.ididntFind,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral03,
                    ),
                    SizedBox(width: 8.w,),
                    CustomText(
                      text: AppStrings.sendAgain,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.strongBlue,
                    ),

                  ],
                ),
                SizedBox(height: 50.h,),
              userAuthController.otpLoading.value
                  ? CustomLoader()
                  : CustomButton(onTap: (){
                   if(userAuthController.otpController.value.text.isEmpty){
                     showCustomSnackBar(AppStrings.fieldCantBeEmpty, isError: true);
                     return;
                   }else {
                     userAuthController.otpValidation(
                         email: userModel.email,
                         screenName: userModel.screenName);
                   }
                },title: AppStrings.confirm,)
              ],
            );
          }
        ),
      ),
    );
  }
}
