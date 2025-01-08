// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/home_services/home_service_controller/home_service_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/inner_widget/custom_style_list_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/style_list_controller/style_list_controller.dart';

class ServiceMapStyleList extends StatefulWidget {
  const ServiceMapStyleList({super.key});
  @override
  State<ServiceMapStyleList> createState() => _ServiceMapStyleListState();
}

class _ServiceMapStyleListState extends State<ServiceMapStyleList> {
  @override
  void initState() {
    // TO DO: implement initState
    homeServiceController.getServiceOutlet();
    super.initState();
  }

  final StyleListController styleListController =
      Get.find<StyleListController>();
  final HomeServiceController homeServiceController =
      Get.find<HomeServiceController>();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () {
            switch (homeServiceController.getServiceOutletLoading.value) {
              case Status.loading:
                return Center(child: CustomLoader());
              case Status.internetError:
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {},
                ); // styleListController.getServiceOutlet());
              case Status.completed:
                return Column(
                  children: [
                    CustomTextField(
                      fieldBorderColor: AppColors.primary,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      fillColor: AppColors.white,
                      hintText: AppStrings.searchLocation,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if (styleListController.currentIndex.value == 0)
                      Column(
                        children: List.generate(
                          homeServiceController.serviceOutletModelList.length,
                          (index) {
                            return CustomStyleListContainer(
                              onTap: () {
                                Get.toNamed(AppRoutes.serviceDetailsScreen,
                                    arguments: homeServiceController
                                        .serviceOutletModelList[index]);
                              },
                              salonName: homeServiceController
                                      .serviceOutletModelList[index].name ??
                                  "",
                              salonAddress: homeServiceController
                                      .serviceOutletModelList[index]
                                      .location
                                      ?.address ??
                                  "",
                              salonImage: homeServiceController
                                      .serviceOutletModelList[index]
                                      .profileImage ??
                                  "",
                              salonRating: homeServiceController
                                  .serviceOutletModelList[index].rating!
                                  .toString(),
                              salonTime: homeServiceController
                                      .serviceOutletModelList[index]
                                      .scheduleStamp
                                      ?.times ??
                                  "",
                              day: homeServiceController
                                      .serviceOutletModelList[index]
                                      .scheduleStamp
                                      ?.days ??
                                  "",
                            );
                          },
                        ),
                      )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
