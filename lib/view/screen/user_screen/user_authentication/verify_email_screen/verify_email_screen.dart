// ignore_for_file: prefer_const_constructors
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

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});
  final UserAuthController userAuthController = Get.find<UserAuthController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Form(
          key: formKey,
          child: Obx(
            () {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.emailConfirmation,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black_50,
                    bottom: 10.h,
                  ),
                  CustomText(
                    text: AppStrings.enterYourEmailForVerification,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral03,
                    bottom: 30.h,
                  ),
                  CustomFormCard(
                    hintText: AppStrings.enterYourEmail,
                    title: AppStrings.email,
                    controller: userAuthController.forgetEmailController.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emailFieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  userAuthController.forgetPasswordLoading.value
                      ? CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              userAuthController
                                  .forgetPassword(isForgot: true,
                                  email: userAuthController.forgetEmailController.value.text,
                              );
                            }
                          },
                          title: AppStrings.sendVerificationCode,

                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
