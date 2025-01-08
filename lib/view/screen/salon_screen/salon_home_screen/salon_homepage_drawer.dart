
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class SalonSideDrawer extends StatelessWidget {
  const SalonSideDrawer({super.key});

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
            child: const CustomImage(
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
                    /*    customRow(
                        title: AppStrings.myProfile,
                        icon: Icons.person,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.salonProfileScreen);
                        }),*/

                    ///====================== My Earning  ======================>

                    customRow(
                        title: AppStrings.earning,
                        //  icon: Icons.money,
                        imageSrc: AppIcons.earning,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.salonEarningScreen);
                        }),

                    ///====================== manage TimeSchedule ======================>
                    customRow(
                        title: AppStrings.manage,
                        icon: Icons.calendar_month_outlined,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.salonTimeScheduleScreen);
                        }),

                    ///====================== Manage Service ======================>
                    customRow(
                      title: AppStrings.service,
                      //  icon: Icons.design_services,
                      imageSrc: AppIcons.drawer_service,
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.salonServiceScreen);
                      },
                    ),

                    ///====================== settings ======================>
                    customRow(
                        title: AppStrings.settings,
                        icon: Icons.settings,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.settingScreen);
                        }),

                    ///====================== reviews ======================>
                    customRow(
                        title: AppStrings.reviews,
                        //icon: Icons.star,
                        imageSrc: AppIcons.dawer_star,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.salonReviewsScreen);
                        }),

                    const SizedBox(
                      height: 12,
                    ),

                    const Divider(
                      height: 2,
                    ),

                    ///====================== aboutUs ======================>
                    customRow(
                        title: AppStrings.aboutUs,
                        icon: Icons.info_outline,
                        onTap: () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.aboutUsScreen);
                        }),

                    ///====================== privacyPolicy ======================>
                    customRow(
                        title: AppStrings.privacyPolicy,
                        icon: Icons.privacy_tip,
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

                    const Divider(
                      height: 2,
                    ),

                    ///====================== Log Out======================>
                    customRow(
                        title: AppStrings.logOut,
                        icon: Icons.logout,
                        onTap: () {
                          Navigator.pop(context);
                          Get.offNamed(AppRoutes.loginScreen);

                          SharePrefsHelper.remove(AppConstants.bearerToken);

                        }),
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
          IconData? icon,
          String? imageSrc,
          required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //  Icon(icon,color: AppColors.black_50,),
                    icon != null
                        ? Icon(
                            icon,
                            color: AppColors.black_50,
                          )
                        : SvgPicture.asset(
                            imageSrc ?? "",
                            height: 20,
                            width: 20,
                          ),
                    /*  CustomImage(
                       imageSrc: imageSrc??"",
                       imageColor: AppColors.black_50,
                        height: 20,
                        width: 20,
                       fit: BoxFit.cover,
                     ),*/

                    /* SvgPicture.asset(
                  imageSrc??"",
                  height: 20,
                  width: 20,
                ),*/
                    CustomText(
                      color: AppColors.black_50,
                      left: 16.w,
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            )),
      );
}
