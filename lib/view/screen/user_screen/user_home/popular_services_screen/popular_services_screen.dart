// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/inner_widget/custom_popular_card.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';

class PopularServicesScreen extends StatelessWidget {
  PopularServicesScreen({super.key});

  final UserHomeController homeController = Get.find<UserHomeController>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.popularServices),
      body: Column(
        children: [
          ///======================= GridView Builder ====================

          homeController.popularServiceModelList.isNotEmpty
              ? Expanded(
                  child: GridView.builder( 
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.popularServiceModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.popularServiceDetailsScreen,
                              arguments: homeController
                                  .popularServiceModelList[index]);
                          // imageController.collectionShowPopup(index: index);
                        },
                        child: CustomPopularCard(
                          image: homeController
                              .popularServiceModelList[index].image,
                          height: 160,
                          width: MediaQuery.sizeOf(context).width / 2,
                          name: homeController
                              .popularServiceModelList[index].name,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                  ),
                )
              : Center(
                  child: Text(AppStrings.noDataFound),
                ),
        ],
      ),
    );
  }
}
