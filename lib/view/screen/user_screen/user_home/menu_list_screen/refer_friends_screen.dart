// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class ReferFriendsScreen extends StatelessWidget {
  const ReferFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 1.2,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  ///========== refer your friend ===========
                  CustomAppBar(appBarContent: AppStrings.referYourFriend),
        
                  ///========== box icon ===========
                  CustomImage(
                    imageSrc: AppIcons.boxicon,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
        
                  ///========== Icon Refer Number ===========
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ///========== flaticon Icon ===========
                      CustomImage(
                        imageSrc: AppIcons.flaticon,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
        
                      ///========== 100 ===========
                      CustomText(
                        top: 10,
                        text: "100",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  CustomText(
                    top: 20.h,
                    text: AppStrings.getFreeCoins,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    bottom: 30.h,
                  ),
                  CustomText(
                    top: 20.h,
                    text:
                        "Invite your friends to join and earn\ncoins as reward. You will get 100\ncoins.They will get 50 coins.",
                    fontSize: 14,
                    maxLines: 3,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    bottom: 30.h,
                  ),
                  Container(
                    height: 90,
                    width: 250,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "You Referral Code",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                            CustomText(
                              text: "8cs445",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 1,
                          color: AppColors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Copy",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            CustomText(
                              text: "Code",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0,right: 20, left: 20),
        child: CustomButton(
          onTap: () {},
          title: AppStrings.shareNow,
          height: 70,
          fontSize: 20,
        ),
      ),
    );
  }
}
