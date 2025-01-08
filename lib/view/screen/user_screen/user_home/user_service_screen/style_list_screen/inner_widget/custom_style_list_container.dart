// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomStyleListContainer extends StatelessWidget {
  final String salonImage;
  final String salonName;
  final String salonAddress;
  final String salonRating;
  final String day;
  final String salonTime;
  final Function()? onTap;
  const CustomStyleListContainer(
      {super.key,
      required this.salonImage,
      required this.salonName,
      required this.salonAddress,
      required this.salonRating,
      required this.day,
      required this.salonTime,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: AppColors.neutral03.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Row(
            children: [
              CustomNetworkImage(
                // ignore: unnecessary_null_comparison
                imageUrl: salonImage != null
                    ? ApiUrl.imageUrl + salonImage
                    : AppConstants.profileImage,
                height: MediaQuery.sizeOf(context).height / 7,
                width: 120,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: CustomText(
                            text: salonName,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black_50,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            CustomText(
                              text: salonRating,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.4,
                          child: CustomText(
                            text: salonAddress,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: day,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2.4,
                              child: CustomText(
                                text: salonTime,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.neutral03,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
