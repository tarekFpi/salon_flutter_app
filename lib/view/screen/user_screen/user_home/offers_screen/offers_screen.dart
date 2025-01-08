// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/inner_widget/custom_sercice_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';
class OffersScreen extends StatelessWidget {
  OffersScreen({super.key});
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  final UserHomeController userHomeController =Get.find<UserHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.offers),
      body: SingleChildScrollView(
        child: Obx(
         (){
            return Column(
              children: List.generate( userHomeController.offersModelList.length
                  , (index){
                    final data = userHomeController.offersModelList[index];
                    return CustomSerciceContainer(
                      profieImage: data.image?? "",
                      name: data.name?? "",
                      shopName: data.outlet?.name?? "",
                      price: "${data.price?.amount?? ""}€",
                      descountPrice: "${data.discount?.amount?? ""}€",
                      shopImage: data.image?? "",
                      favoriteOnTap : (){
                      },
                      favColor: userHomeController.isFavorite(data.id?? "") ? AppColors.primary : AppColors.neutral03,
                      onTapBook: (){
                        Get.toNamed(AppRoutes.bookPaymentScreen);
                      },
                      onTap: () {
                        //  Get.toNamed(Routes.offerDetailsScreen);
                      },
                    );
              }),
            );
          }
        ),
      ),
    );
  }
}
