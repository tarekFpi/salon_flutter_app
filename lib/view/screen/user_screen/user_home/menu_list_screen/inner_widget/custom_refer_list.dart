// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomReferList extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String point;
  const CustomReferList(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.point});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: imageUrl,
                height: 50,
                width: 50,
                boxShape: BoxShape.circle,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: name,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.black_50,
              ),
            ],
          ),
          Container(
            height: 35,
            width: 55,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: CustomText(
                              text: point,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                  maxLines: 2,
                            )),
          )
        ],
      ),
    );
  }
}
