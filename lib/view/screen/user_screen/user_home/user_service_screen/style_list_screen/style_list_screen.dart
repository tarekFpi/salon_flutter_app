// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/inner_widget/custom_style_list_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_service_screen/style_list_screen/style_list_controller/style_list_controller.dart';

class StyleListScreen extends StatelessWidget {
  StyleListScreen({super.key});
  final StyleListController styleListController =
      Get.find<StyleListController>();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () {
            switch (styleListController.recommendServiceLoading.value) {
              case Status.loading:
                return Center(child: CustomLoader());
              case Status.internetError:
                return Center(child: CustomLoader());
              case Status.error:
                return GeneralErrorScreen(
                    onTap: () => styleListController.getRecommendService());
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
                          styleListController.recommendServicesModelList.length,
                          (index) {
                            final data = styleListController
                                .recommendServicesModelList[index];
                            return CustomStyleListContainer(
                              salonName: data.name ?? "",
                              salonAddress: data.location?.address ?? "",
                              salonImage: data.profileImage ?? "",
                              salonRating: "${data.rating ?? 0}",
                              salonTime: data.createdAt ?? "",
                              day: DateConverter.formatDayOfWeek(
                                  data.createdAt ?? ""),
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
