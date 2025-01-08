// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomPopularCard extends StatelessWidget {
  const CustomPopularCard(
      {super.key,
      this.onTap,
      this.height = 130,
      this.width = 130,
      this.image,
      this.name});
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final String? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CustomNetworkImage(
              imageUrl: ApiUrl.imageUrl + image!,
              height: height ?? 130,
              width: width ?? 130,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            bottom: 25.h,
            right: 0,
            left: 0,
            child: CustomText(
              text: name ?? '',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
