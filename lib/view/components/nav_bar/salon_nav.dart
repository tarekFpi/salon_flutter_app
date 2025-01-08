// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_home_screen.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../screen/salon_screen/salon_profile/salon_profile_screen.dart';
import '../custom_text/custom_text.dart';

class NavBarSalon extends StatefulWidget {
  final int currentIndex;

  const NavBarSalon({required this.currentIndex, super.key});

  @override
  State<NavBarSalon> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<NavBarSalon> {
  late int bottomNavIndex;

  final List<String> selectedIcon = [
    AppIcons.homeNavbarIcon,
    //  AppIcons.homesScan_qu,
    AppIcons.personIcon,
  ];

  final List<String> unselectedIcon = [
    AppIcons.homeNavbarIcon,

    ///  AppIcons.homesScan_qu,
    AppIcons.personIcon,
  ];

  final List<String> userNavText = [
    AppStrings.home,

    /// AppStrings.qrCode,
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
          color: AppColors.neutral03.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        fontWeight: FontWeight.w600,
                        fontSize: 14.w,
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
          Get.offAll(() => SalonHomeScreen());
          break;

        /*  case 1:
          Get.to(() => SalonQrScreen());
          break;*/

        case 1:
          Get.to(() => SalonProfileScreen());
      }
    }
  }
}
