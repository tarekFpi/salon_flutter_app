// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/start_chat_screen/start_chat_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_services_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_screen.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_page.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_qr_code_screen/user_qr_code_screen.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<NavBar> {
  late int bottomNavIndex;

  final List<String> selectedIcon = [
    AppIcons.homeNavbarIcon,
    AppIcons.mapNavbarIcon,
    AppIcons.qrCodeIcon,
    AppIcons.chatIcon,
    AppIcons.personIcon,
  ];
  final List<String> unselectedIcon = [
    AppIcons.homeNavbarIcon,
    AppIcons.mapNavbarIcon,
    AppIcons.qrCodeIcon,
    AppIcons.chatIcon,
    AppIcons.personIcon,
  ];

  final List<String> userNavText = [
    AppStrings.home,
    AppStrings.services,
    AppStrings.qrCode,
    AppStrings.message,
    AppStrings.profile,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      // color: AppColors.dartBlue,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: AppColors.neutral03.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]
          /*  gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.navbarFirst, AppColors.navbarSecond])*/
          ),
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          selectedIcon.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index == bottomNavIndex
                    ? Card(
                        elevation: 100,
                        shadowColor: AppColors.softlimegreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        color: Colors.transparent,
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              selectedIcon[index],
                              height: 24.h,
                              width: 24.w,
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    : SvgPicture.asset(
                        unselectedIcon[index],
                        height: 24.h,
                        width: 24.w,
                        // ignore: deprecated_member_use
                        color: AppColors.black_50,
                      ),
                SizedBox(height: 4.h),
                index == bottomNavIndex
                    ? const SizedBox()
                    : CustomText(
                        text: userNavText[index],
                        color: AppColors.black_50,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.w,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      switch (index) {
        case 0:
          Get.offAll(() => UserHomePage());
          break;
        case 1:
          Get.to(() => HomeServicesScreen());
          break;
        case 2:
          Get.to(() => UserQrCodeScreen());
          break;
        case 3:
          Get.to(() => StartChatScreen());
          break;
        case 4:
          Get.to(() => ProfileScreen());
      }
    }
  }
}
