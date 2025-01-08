import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class CustomScheduleDay extends StatelessWidget {
  final String dayName;
  final String time;
  const CustomScheduleDay(
      {super.key, required this.dayName, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 60.h,
                width: 3.w,
                color: AppColors.greenColor,
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: dayName,
                fontSize: 16.w,
                color: AppColors.greenColor,
                fontWeight: FontWeight.w500,
                bottom: 6.h,
              ),
              CustomText(
                text: time,
                fontSize: 14.w,
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              )
            ],
          )
        ],
      ),
    );
  }
}
