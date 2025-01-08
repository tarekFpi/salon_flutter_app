// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/inner_widget/custom_schedule_day.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/inner_widget/custom_sercice_container.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/inner_widget/service_details_appbar.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/service_controller/service_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});
  final ServiceController serviceController = Get.find<ServiceController>();
  final UserHomeController userHomeController = Get.find<UserHomeController>(); 


    final  serviceOutletModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    //  final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: CustomAppBar(appBarContent: "Service Details"),
      body: Obx(() {
        return Column(
          children: [
            ServiceDetailsAppbar(
              imageUrl: serviceOutletModel.profileImage ?? "",
            ),
            Card(
              color: Colors.white,
              elevation: 10,
              shadowColor: AppColors.white,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomNetworkImage(
                            imageUrl: serviceOutletModel.profileImage != null
                                ? ApiUrl.imageUrl +
                                    serviceOutletModel.profileImage
                                : AppConstants.profileImage,
                            height: 90.w,
                            width: 90.w,
                            boxShape: BoxShape.circle,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: serviceOutletModel.name ?? "",
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral03,
                                  bottom: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: CustomText(
                                        text: serviceOutletModel
                                                .location?.address ??
                                            "",
                                        fontSize: 12.w,
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    CustomText(
                                      left: 6.w,
                                      text:
                                          serviceOutletModel.rating.toString(),
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.neutral03,
                                    ),
                                  ],
                                ),

                                //  CustomImage(imageSrc: AppIcons.location),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  ///============== Tab bar=========
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          serviceController.tabNamelist.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            serviceController.currentIndex.value = index;
                            serviceController.update();
                          },
                          child: CustomText(
                            text: serviceController.tabNamelist[index],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: serviceController.currentIndex.value == index
                                ? AppColors.primary
                                : AppColors.black_50,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 1,
                    width: screenWidth,
                    color: AppColors.grey1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///=========== service Container======
                  if (serviceController.currentIndex.value == 0)
                    Column(
                      children: List.generate(
                          userHomeController.offersModelList.length, (index) {
                        final data = userHomeController.offersModelList[index];
                        return CustomSerciceContainer(
                          profieImage: data.image ?? "",
                          name: data.name ?? "",
                          shopName: data.outlet?.name ?? "",
                          price: "${data.price?.amount ?? ""}€",
                          descountPrice: "${data.discount?.amount ?? ""}€",
                          shopImage: data.image ?? "",
                          onTapBook: () {
                            Get.toNamed(AppRoutes.bookPaymentScreen);
                          },
                          onTap: () {
                            //  Get.toNamed(Routes.offerDetailsScreen);
                          },
                        );
                      }),
                    ),

                  ///============== Schedule ==============
                  if (serviceController.currentIndex.value == 1)
                    Column(
                      children: [
                        CustomScheduleDay(
                          dayName: serviceOutletModel.scheduleStamp?.days ?? "",
                          time: serviceOutletModel.scheduleStamp?.times ?? "",
                        ),
                      ],
                    ),
                  /*    Column(
                      children: List.generate(
                        7,
                        (index) {
                          return
                        },
                      ),
                    ),*/
                  if (serviceController.currentIndex.value == 2)
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.lightwhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///================= About =========
                            CustomText(
                              text: "About",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black_50,
                              bottom: 15.h,
                            ),

                            ///================ About Title ===========
                            CustomText(
                              text: serviceOutletModel.about ?? "",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              bottom: 15.h,
                            ),

                            ///================= Name =========
                            CustomText(
                              text: "Name",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black_50,
                              bottom: 15.h,
                            ),

                            ///================= Name Title  =========
                            CustomText(
                              text: serviceOutletModel.name ?? "",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              bottom: 15.h,
                            ),

                            ///================= Location =========
                            CustomText(
                              text: "Location",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black_50,
                              bottom: 15.h,
                            ),

                            ///================= Location Title  =========
                            CustomText(
                              text: serviceOutletModel.location?.address ?? "",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              bottom: 15.h,
                            ),

                            ///================= Experience =========
                            CustomText(
                              text: "Experience",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black_50,
                              bottom: 15.h,
                            ),

                            ///================= Experience Title  =========
                            CustomText(
                              text: serviceOutletModel.experience ?? "",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              bottom: 15.h,
                            ),

                            ///================= Experience =========
                            CustomText(
                              text: "Salon type",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black_50,
                              bottom: 15.h,
                            ),

                            ///================= Experience Title  =========
                            CustomText(
                              text: "All",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral03,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              bottom: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
