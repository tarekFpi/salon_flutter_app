// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';


class ServiceSalonAlertWarning extends StatefulWidget {
  ServiceSalonAlertWarning({super.key});


  @override
  State<ServiceSalonAlertWarning> createState() => _AlertSalonHomeState();
}

class _AlertSalonHomeState extends State<ServiceSalonAlertWarning> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ///================== Confirm Warning ===================//
            const CustomText(
              text: "Warning",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.homePopupTextColor,
              bottom: 10,
            ),

            ///================== Confirm  Services have been updated.  ===================//
            const CustomText(
              text: "Services have been updated. ",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black_50,
              bottom: 10,
            ),

            ///================== Confirm  Services have been updated.  ===================//
            const CustomText(
              text: "Please make sure all submitted \n information is correct.",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackButtonFild,
              bottom: 10,
            ),

            ///================== Confirm  Service Category    ===================//
            const CustomText(
              text: "Service Category : Afro Hair Style",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.neutral03,
              bottom: 10,
            ),

            const CustomText(
              text: "Service Name : Special Afro Hair Style",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black_50,
              bottom: 10,
            ),

            const CustomText(
              text: "Price : 100€",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.neutral03,
              bottom: 10,
            ),

            ///================== Confirm ===================//
            CustomButton(onTap: (){
              Navigator.of(context).pop();
              setState(() {

              });
            },title: "Confirm",),
          ],
        ),
      ),
    );
  }
}