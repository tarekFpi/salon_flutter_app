// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomOfferContainer extends StatelessWidget {
  final String? image;
  final String? name;
  final String? saloneName;
  final String? price;
  final String? discount;
  final Function()? onTapBook;
  final Function()? onTap;
  const CustomOfferContainer({
    super.key,
    this.onTap,
    this.image,
    this.name,
    this.saloneName,
    this.price,
    this.discount,
    this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        bottom: 20,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(15),
              width: 214.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neutral03.withOpacity(0.2),
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name ?? "",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black_50,
                    bottom: 5,
                  ),
                  Row(
                    children: [
                      CustomNetworkImage(
                          height: 24,
                          imageUrl: image != null
                              ? ApiUrl.imageUrl + image!
                              : AppConstants.profileImage,
                          width: 24,
                          boxShape: BoxShape.circle),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: saloneName ?? "",
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_50,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: price ?? "",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_50,
                            right: 6.w,
                          ),
                          CustomText(
                            text: discount ?? "",
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400,
                            color: AppColors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: AppStrings.book,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite_border,
                color: AppColors.primary,
              ))
        ],
      ),
    );
  }
}
