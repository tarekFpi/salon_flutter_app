// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomBookPaymentContainer extends StatelessWidget {
  final String image;
  final String? name;
  final String? title;
  final String? price;

  final Function()? onTap;
  const CustomBookPaymentContainer({
    super.key,
    required this.image,
    this.name,
    this.title,
    this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          // height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: AppColors.neutral03.withOpacity(0.2),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ]),
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: ApiUrl.imageUrl + image,
                height: 80.h,
                width: 80.w,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name ?? '',
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black_50,
                  ),
                  CustomText(
                    text: title ?? '',
                    fontSize: 12.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral03,
                  ),
                  CustomText(
                    text: price ?? '',
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
