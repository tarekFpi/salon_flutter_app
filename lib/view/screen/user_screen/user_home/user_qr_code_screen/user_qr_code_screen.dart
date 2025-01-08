import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_images/app_images.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';

class UserQrCodeScreen extends StatelessWidget {
  const UserQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     // appBar: CustomAppBar(appBarContent: "Scan QR Code"),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                height: 70.w,
              ),

              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomText(
                      text: "QR Scanner",
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutral03,
                      bottom: 10.h,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomText(
                      text: "Your order will be confirmed ",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutral03,
                      bottom: 8.h,
                    ),
                  ),

                  ///================== by scanning the QR Code ===================//
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomText(
                      text: "by scanning the QR Code",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                      bottom: 8.h,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 12.w,
              ),

              ///================== by scanning the QR Image ===================//
              Image.asset(AppImages.qr_image),

              ///================== Scan Button ===================//

              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.salonOrderHistory);
              },title: AppStrings.scan,),

              SizedBox(
                height: 1.h,
              ),

            ]
        ),
      ),
       bottomNavigationBar: const NavBar(currentIndex: 2),
    );
  }
}