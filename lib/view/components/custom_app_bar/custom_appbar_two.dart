// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomAppbarTwo extends StatelessWidget implements PreferredSizeWidget {
  final String appBarContent;

  final IconData? icon;

  final IconData? serfixIcon;
  final IconData? prefixIcon;

  final void Function()? onTap;
  final void Function()? serfixOnTap;

  const CustomAppbarTwo({
    super.key,
    required this.appBarContent,
    this.onTap,
    this.icon,
    this.serfixIcon,
    this.prefixIcon,
    this.serfixOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: [
          GestureDetector(
              onTap: serfixOnTap,
              child: Icon(
                serfixIcon,
                color: AppColors.primary,
                size: 28,
              )),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.transparent,
      /*  leading: IconButton(
            onPressed: onTap ??
                    () {
                  Navigator.pop(context);
                },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primary,
              size: 24,
            )),*/
        title: CustomText(
          text: appBarContent,
          fontSize: 20.w,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ));
  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
