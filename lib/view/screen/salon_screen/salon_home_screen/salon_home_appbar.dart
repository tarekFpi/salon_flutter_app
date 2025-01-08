// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';

class CustomSalonHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarContent;

  final IconData? icon;

  final IconData? serfixIcon;
  final IconData? prefixIcon;

  final void Function()? onTap;
  final void Function()? serfixOnTap;

  const CustomSalonHomeAppBar({
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

      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: onTap ??
                  () {
                Navigator.pop(context);
              },
          icon: const Icon(
            Icons.menu,
            color: AppColors.primary,
            size: 20,
          )),
      title: CustomImage(imageSrc: appBarContent),
    );
  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
