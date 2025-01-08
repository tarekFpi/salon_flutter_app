// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
class UserServiceScreen extends StatelessWidget {
  const UserServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///================== map ===================//
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.serviesMapScreen);
              },
              title: AppStrings.map,
              height: 70,
              fontSize: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ///================== recommend salon ===================//
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.styleListScreen);
              },
              title: AppStrings.recommendSalon,
              height: 70,
              fontSize: 20,
            ),
          ],
        ),
      ),
    //  bottomNavigationBar: const NavBar(currentIndex: 1),
    );
  }
}
