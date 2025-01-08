// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_images/app_images.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_controller/profile_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/inner_widget/custom_offer_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/inner_widget/custom_popular_card.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/inner_widget/custom_slider_drawer.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/inner_widget/home_appbar.dart';
import 'user_home_controller/user_home_controller.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({super.key});

  final UserHomeController userHomeController = Get.find<UserHomeController>();
  final ProfileController profileController = Get.find<ProfileController>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DoctorSideDrawer(),
      //================================== appBar ================================//
      appBar: CustomHomeAppBar(
        menuKey: scaffoldKey,
        // onTap: () {},
        appBarContent: AppImages.appLogo,
        //prefixIcon: Icons.menu,
        serfixIcon: Icons.notifications_outlined,
        serfixOnTap: () {
          Get.toNamed(AppRoutes.notificationScreen);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Obx(() {
            switch (userHomeController.sliderImageLoading.value) {
              case Status.loading:
                return Center(child: CustomLoader());
              case Status.internetError:
                return GeneralErrorScreen(
                    onTap: () => userHomeController.getSliderImage());
              case Status.error:
                return GeneralErrorScreen(
                    onTap: () => userHomeController.getSliderImage());
              case Status.completed:
                return Column(
                  children: [
                    Row(
                      children: [
                        //================== Profile Image ===================//
                        CustomNetworkImage(
                          imageUrl:
                              "${ApiUrl.imageUrl}${profileController.profileModel.value.image ?? ''}",
                          height: 80,
                          width: 80,
                          boxShape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primary, width: 2),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'welcome'.tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              bottom: 10.h,
                            ),
                            //================== Name ===================//
                            CustomText(
                              text: profileController
                                      .profileModel.value.fullName ??
                                  '',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black_50,
                              bottom: 5.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primary,
                                ),
                                //================== Location ===================//
                                CustomText(
                                  text: profileController
                                          .profileModel.value.address ??
                                      "",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///======== Carousel Slider ====================
                    userHomeController.sliderImageModelList.isNotEmpty
                        ? CarouselSlider.builder(
                            options: CarouselOptions(
                              initialPage: userHomeController
                                  .sliderImageModelList.length,
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              height: 130.h,
                              onPageChanged: (index, reason) {
                                userHomeController.currentIndex.value = index;
                              },
                            ),
                            itemCount:
                                userHomeController.sliderImageModelList.length,
                            itemBuilder: (context, index, realIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomNetworkImage(
                                  imageUrl:
                                      "${ApiUrl.imageUrl}${userHomeController.sliderImageModelList[index].image ?? ""}",
                                  width: MediaQuery.of(context).size.width,
                                  height: 130.h,
                                ),
                              );
                            },
                          )
                        : Container(
                            height: 130.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                color: AppColors.neutral03,
                                borderRadius: BorderRadius.circular(10)),
                          ),

                    SizedBox(
                      height: 10.h,
                    ),

                    ///======== Dots ===========
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          userHomeController.sliderImageModelList.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///======== Next Appointment ===========
                    Row(
                      children: [
                        CustomImage(imageSrc: AppIcons.timeIcon),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                          text: 'Next Appointment',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    ///======== Salon Name ===========
                    Row(
                      children: [
                        CustomText(
                          text: "Afro hair care",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.neutral03,
                          right: 10,
                        ),
                        CustomText(
                          text: "Pir baba Salon",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ///======== Location and Time ===========
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            CustomText(
                              textAlign: TextAlign.start,
                              text: "15 Rue des Saints-Pères,\n75006 Paris",
                              fontSize: 12,
                              maxLines: 2,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black_50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time_sharp),
                            CustomText(
                              textAlign: TextAlign.start,
                              text: "10 may, 2024-10:00 Am",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black_50,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///======== Popular Services  ===========
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImage(imageSrc: AppIcons.fireIcon),
                            CustomText(
                              left: 5,
                              text: 'popularServices'.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.popularServicesScreen);
                          },
                          child: CustomText(
                            text: 'viewAll'.tr,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.neutral03,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ///======== Popular Services Card Image ===========
                    userHomeController.popularServiceModelList.isNotEmpty
                        ? SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,  
                            crossAxisAlignment: CrossAxisAlignment.start,
                          
                            
                            children: List.generate(
                                userHomeController
                                    .popularServiceModelList.length, (index) {
                              return CustomPopularCard(
                                name: userHomeController
                                        .popularServiceModelList[index]
                                        .name ??
                                    "",
                                image: userHomeController
                                        .popularServiceModelList[index]
                                        .image ??
                                    "",
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.popularServiceDetailsScreen,
                                    arguments: userHomeController
                                        .popularServiceModelList[index],
                                  );
                                },
                              );
                            }),
                          ),
                        )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),

                    ///======== Offers ===========
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImage(imageSrc: AppIcons.offersIcon),
                            CustomText(
                              left: 5,
                              text: AppStrings.offers,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.offersScreen);
                          },
                          child: CustomText(
                            text: AppStrings.viewAll,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.neutral03,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),

                    ///======== Offers Card Image ===========
                    userHomeController.offersModelList.isNotEmpty
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: List.generate(
                                    userHomeController.offersModelList.length,
                                    (index) {
                                  final data =
                                      userHomeController.offersModelList[index];
                                  return CustomOfferContainer(
                                    image: data.image ?? "",
                                    name: data.name ?? "",
                                    saloneName: data.outlet?.name ?? "",
                                    price: "${data.price?.amount ?? ""}€",
                                    discount: "${data.discount?.amount ?? ""}€",
                                    onTap: () {
                                      //  Get.toNamed(Routes.offerDetailsScreen);
                                    },
                                  );
                                }),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                );
            }
          }),
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 0,
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: userHomeController.currentIndex.value == index ? 30 : 15,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: userHomeController.currentIndex.value == index
            ? AppColors.primary
            : AppColors.neutral03,
      ),
    );
  }
}
