// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
class CustomReviewName extends StatelessWidget {
  final String title;
  final String name;
  const CustomReviewName({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            top: 10,
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black_50,
            bottom: 5,
          ),
          CustomText(
            text: name,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black_50,
            bottom: 5,
          ),
        ],
      ),
    );
  }
}
