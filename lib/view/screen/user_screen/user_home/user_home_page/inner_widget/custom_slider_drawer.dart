// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class DoctorSideDrawer extends StatelessWidget {
  const DoctorSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
        color: AppColors.white,
      ),
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        children: [
          ///================================ APP LOGO ==============================///
          Container(
            height: 122,
            alignment: Alignment.bottomCenter,
            color: AppColors.white,
            child:  CustomImage(
              imageSrc: AppIcons.logo,
              // imageColor: AppColors.white,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///====================== myProfile ======================>
                    customRow(
                        title: AppStrings.myProfile,
                        icon: Icons.person,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.profileScreen);
                        }),

                    ///====================== wishlist ======================>
                    customRow(
                        title: AppStrings.wishlist,
                        icon: Icons.favorite_border,
                        onTap: () {
                          Navigator.pop(context);
                         Get.toNamed(AppRoutes.wishlistScreen);
                        }),

                    ///====================== settings======================>
                    customRow(
                        title: AppStrings.settings,
                        icon: Icons.settings,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.settingScreen);
                        }),
                     Divider(color: AppColors.greyGrey_50,thickness: 1,),
                    ///====================== inviteFriends ======================>
                    customRow(
                        title: AppStrings.inviteFriends,
                        icon: Icons.interpreter_mode_sharp,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.referFriendsScreen);
                        }),

                /*    ///====================== referList ======================>
                    customRow(
                        title: AppStrings.referList,
                        icon: Icons.event_note,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.referListScreen);
                        }),
*/
                    ///====================== aboutUsText ======================>
                    customRow(
                        title: AppStrings.aboutUsText,
                        icon: Icons.info_outline,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.aboutUsScreen);
                        }),

                    ///====================== privacyPolicy ======================>
                    customRow(
                        title: AppStrings.privacyPolicy,
                        icon: Icons.privacy_tip_outlined,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        }),

                    ///====================== termsAndConditions ======================>
                    customRow(
                        title: AppStrings.termsAndConditions,
                        icon: Icons.task_rounded,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.termsConditionsScreen);
                        }),



                    SizedBox(
                      height: 100.h,
                    ),
                    ///====================== termsAndConditions ======================>
                    customRow(
                        title: AppStrings.logOut,
                        icon: Icons.logout,
                        onTap: () {
                          Navigator.pop(context);
                          Get.offNamed(AppRoutes.loginScreen);

                          SharePrefsHelper.remove(AppConstants.bearerToken);

                          SharePrefsHelper.remove(AppConstants.role);
                        }),

                    ///====================== Log Out======================>
                 /*   GestureDetector(
                      onTap: () {
                        SharePrefsHelper.remove(AppConstants.bearerToken);
                        SharePrefsHelper.remove(AppConstants.role);
                        SharePrefsHelper.remove(AppConstants.rememberMe);

                        Get.deleteAll(force: true).then((_) {
                          DependencyInjection di = DependencyInjection();
                          di.dependencies();
                        }); // Dispose of all instances forcefully
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      child: Row(
                        children: [
                          const CustomImage(
                            imageSrc: AppIcons.logOut,
                            imageType: ImageType.svg,
                            imageColor: AppColors.whiteDarker,
                          ),
                          CustomText(
                            color: AppColors.whiteDarker,
                            left: 16.w,
                            text: AppStrings.logOut,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customRow(
      {required String title,
       // required String icon,
        required IconData? icon,
        required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon,color: AppColors.black_50,),
                   /* CustomImage(
                      imageSrc: icon,
                      imageType: ImageType.svg,
                      imageColor: AppColors.black_50,
                    ),*/
                    CustomText(
                      color: AppColors.black_50,
                      left: 16.w,
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              /*  SizedBox(
                  height: 12.h,
                ),
                const Divider()*/
              ],
            )),
      );
}
