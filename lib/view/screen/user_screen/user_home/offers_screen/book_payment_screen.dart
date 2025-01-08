// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/offers_screen/inner_widget/custom_book_payment_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/offers_screen/offers_controller/offers_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_model/popular_service_model.dart';

class BookPaymentScreen extends StatelessWidget {
  BookPaymentScreen({super.key});

  final OffersController offersController = Get.find<OffersController>();

  final PopularServiceModel popularServiceModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: CustomAppBar(appBarContent: AppStrings.payment),
  body: Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
    child: ListView(
      shrinkWrap: true,
      children: [
        CustomBookPaymentContainer(
          // ignore: invalid_use_of_protected_member
          name: popularServiceModel.name,
          // ignore: invalid_use_of_protected_member
          title: popularServiceModel.outlet?.name,
          // ignore: invalid_use_of_protected_member
          price: "${popularServiceModel.price?.amount ?? '0'}€",
          image: popularServiceModel.image ?? '',
        ),
        SizedBox(
          height: 260,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: AppColors.primary,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.total,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black_50,
            ),
            CustomText(
              text: "${popularServiceModel.price?.amount ?? '0'}€",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black_50,
            ),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        CustomButton(
          onTap: () {
            Get.toNamed(AppRoutes.salonConfirmScheduleScreen);
          },
          title: AppStrings.confirmSchedule,
        ),
      ],
    ),
  ),
);

  }
}
