// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarContent;

  final IconData? icon;
  final GlobalKey<ScaffoldState> menuKey;

  final IconData? serfixIcon;
  final IconData? prefixIcon;

  final void Function()? onTap;
  final void Function()? serfixOnTap;

  const CustomHomeAppBar({
    super.key,
    required this.appBarContent,
    this.onTap,
    this.icon,
    this.serfixIcon,
    this.prefixIcon,
    this.serfixOnTap, required this.menuKey,
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
            child: Badge.count(
              backgroundColor: AppColors.primary,
              count: 3,
              child: Icon(
                serfixIcon,
                color: AppColors.primary,
                size: 28,
              ),
            )),
        SizedBox(
          width: 10,
        )
      ],
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: onTap ??
                () {
            menuKey.currentState?.openDrawer();
            },
        icon: const Icon(
          Icons.menu,
          color: AppColors.primary,
          size: 20,
        ),
      ),
      title: CustomImage(imageSrc: appBarContent),
    );
  }

  @override
  // TO DO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
