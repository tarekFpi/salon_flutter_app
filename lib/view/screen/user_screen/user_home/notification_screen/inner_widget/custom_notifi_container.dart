// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
class CustomNotifiContainer extends StatelessWidget {
  const CustomNotifiContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10.0),
      child: Container(
        //height: 80,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Please rate your service",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                bottom: 5,
              ),
              CustomText(
                text: "Pleas your favorite salon is waiting for rating.",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                bottom: 5,
              ),
              CustomText(
                text: "20-Dec-2024, 3:00 PM",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
