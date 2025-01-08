// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_service_controller/home_service_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/inner_widget/custom_popular_card.dart';
class HomeServicesScreen extends StatelessWidget {
  final Function()? onTap;
  HomeServicesScreen({super.key, this.onTap});
  final HomeServiceController homeServiceController =Get.find<HomeServiceController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.categories),
      body: Obx(
        () {
          switch (homeServiceController.getHomeServiceLoading.value) {
            case Status.loading:
              return Center(child: CustomLoader());
            case Status.internetError:
            case Status.error:
              return GeneralErrorScreen(
                  onTap: () => homeServiceController.getHomeService());
            case Status.completed:
              return Column(
                children: [

                  ///======================= GridView Builder ====================
                  GridView.builder(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeServiceController.homeServiceModelList
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          homeServiceController.comonId.value = homeServiceController.homeServiceModelList[index].id ?? "";
                          homeServiceController.comonId.refresh();
                          Get.toNamed(AppRoutes.userServiceScreen);
                          // imageController.collectionShowPopup(index: index);
                        },
                        child: CustomPopularCard(
                          image: homeServiceController
                              .homeServiceModelList[index].image,
                          name: homeServiceController
                              .homeServiceModelList[index].name,
                          height: 160,
                          width: MediaQuery
                              .sizeOf(context)
                              .width / 2,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                  ),
                ],
              );
          }
        }),
      bottomNavigationBar: NavBar(
        currentIndex: 1,
      ),
    );
  }
}
