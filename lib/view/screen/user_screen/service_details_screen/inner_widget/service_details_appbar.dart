// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';

class ServiceDetailsAppbar extends StatelessWidget {
  const ServiceDetailsAppbar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          // ignore: unnecessary_null_comparison
          imageUrl: imageUrl != null
              ? ApiUrl.imageUrl + imageUrl
              : AppConstants.profileImage,
          height: MediaQuery.sizeOf(context).height / 4,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          top: 50.h,
          left: 10.h,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
                size: 20,
              )),
        ),
      ],
    );
  }
}
