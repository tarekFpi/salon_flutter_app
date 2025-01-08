// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomSerciceContainer extends StatelessWidget {
  final Function()? onTap;
  final String? profieImage;
  final String? shopImage;
  final String? name;
  final String? shopName;
  final String? price;
  final Color? favColor;
  final String? descountPrice;
  final Function()? onTapBook;
  final Function()? favoriteOnTap;
  const CustomSerciceContainer(
      {super.key,
      this.onTap,
      this.profieImage,
      this.name,
      this.shopName,
      this.price,
      this.descountPrice,
      this.shopImage,
      this.onTapBook,
      this.favoriteOnTap,
      this.favColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20,
        bottom: 20,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.neutral03.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomNetworkImage(
                      imageUrl: shopImage != null
                          ? ApiUrl.imageUrl + shopImage!
                          : AppConstants.profileImage,
                      height: 60.h,
                      width: 60.w,
                      boxShape: BoxShape.circle),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name ?? "",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black_50,
                        bottom: 8.h,
                      ),
                      CustomText(
                        text: "(Without appointment)",
                        fontSize: 10.w,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_50,
                        bottom: 8.h,
                      ),
                      Row(
                        children: [
                          CustomNetworkImage(
                              imageUrl: shopImage != null
                                  ? ApiUrl.imageUrl + shopImage!
                                  : AppConstants.profileImage,
                              height: 22.h,
                              width: 22.w,
                              boxShape: BoxShape.circle),
                           SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            text: shopName ?? "",
                            fontSize: 14.w,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_50,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            top: 5.h,
                            text: price ?? "",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black_50,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CustomText(
                            text: descountPrice ?? "",
                            fontSize: 14.w,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: favoriteOnTap,
                child: Icon(
                  Icons.favorite_border,
                  color: favColor ?? AppColors.primary,
                  size: 30,
                ),
              )),
          Positioned(
            bottom: 15,
            right: 15,
            child: GestureDetector(
              onTap: onTapBook,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CustomText(
                  text: AppStrings.book,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
