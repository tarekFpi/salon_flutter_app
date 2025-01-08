import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';


class CustomTimeShap extends StatelessWidget {
  final Color color;
  final String text;
  const CustomTimeShap({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 30.h,
        width: 75.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: CustomText(
                text: text,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.verydarkgray)),
      ),
    );
  }
}
