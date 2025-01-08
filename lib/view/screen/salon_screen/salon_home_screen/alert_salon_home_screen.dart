// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class AlertSalonHome extends StatefulWidget { AlertSalonHome({super.key});


  @override
  State<AlertSalonHome> createState() => _AlertSalonHomeState();
}

class _AlertSalonHomeState extends State<AlertSalonHome> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Stack(
               clipBehavior: Clip.none,
               children: [

                Positioned(
                  // top: -4,
                  child:  CustomNetworkImage(
                  imageUrl: AppConstants.profileImage,
                  height: 80,
                  width: 80,
                  boxShape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),),

            /*    Positioned(
                  top: -50,
                  right: -130,
                  child:  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(widget.ctx).pop();
                        setState(() {

                        });
                      },
                      child: Icon(
                        Icons.close,
                        size: 32,
                        color: Colors.black,
                      )),
                  ),)*/
              ],
            ),


            SizedBox(
              height: 8.h,
            ),

            ///================== Name ===================//
            CustomText(
              text: "Mr. Mahmud",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              bottom: 5.h,
            ),

            CustomText(
              text: "mahmud@gmail.com",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black_50,
              bottom: 5.h,
            ),

            CustomText(
              text:
              "76/4 R no. 60/1 Rue des \n Saints-Paris, 75005 Paris",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black_50,
              bottom: 5.h,
            ), //

            CustomText(
              text: "+099999215",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black_50,
              bottom: 5.h,
            ),

            SizedBox(
              height: 8.h,
            ),
            const Divider(
              height: 3,
              color: Colors.black38,
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: "Order details",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black_50,
                bottom: 5.h,
              ),
            ),
            SizedBox(
              //width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CustomImage(
                        imageSrc: AppIcons.rectangleSalon,
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      CustomText(
                        text: "Home Services",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black_50,
                        bottom: 5.h,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomImage(
                        imageSrc: AppIcons.rectangleSalon,
                      ),
                      CustomText(
                        text: "Upcoming",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black_50,
                        bottom: 5.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "#11111111",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black_50,
                        bottom: 5.h,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      CustomText(
                        text: "Unpaid",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                        bottom: 5.h,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.homeclock1),
                      SizedBox(
                        width: 8.h,
                      ),
                      const CustomText(
                        text: "10 may, 2024-10:00 Am",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.homePopupTextColor3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                CustomImage(imageSrc: AppIcons.clint_icon),
                SizedBox(
                  width: 8.h,
                ),
                const CustomText(
                  text: "10 may, 2024",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              height: 3,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Nottes",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
                CustomText(
                  text: "80€",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Tissages",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
                CustomText(
                  text: "80€",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              height: 3,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Total",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
                CustomText(
                  text: "200€",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackButtonFild,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Salon earning",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.homeGreenColor3,
                ),
                CustomText(
                  text: "190€",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.homeGreenColor3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
