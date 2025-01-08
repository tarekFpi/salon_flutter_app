// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/alert_salon_home_screen.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_qr_screen/salon_order_controller/salon_order_controller.dart';
class SalonOrderHistory extends StatelessWidget {
  SalonOrderHistory({super.key});
  final SalonOrderController salonOrderController =
  Get.find<SalonOrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: AppStrings.orderHistory),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Obx(
                () {
              switch (salonOrderController.orderHistoryLoading.value) {
                case Status.loading:
                  return Center(child: CustomLoader());
                case Status.internetError:
                  return Center(child: GeneralErrorScreen(
                      onTap: () => salonOrderController.getOrderHistory()));
                case Status.error:
                  return GeneralErrorScreen(
                      onTap: () => salonOrderController.getOrderHistory());
                case Status.completed:
                  final orderHistoryList = salonOrderController.orderHistoryList;
                  if (orderHistoryList.isEmpty) {
                    return Center(
                      child: CustomText(
                        text: "No orders found",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black_50,
                      ),
                    );
                  }

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///================== order History ListView ===================//
                        ListView.builder(
                          padding: EdgeInsets.only(top: 16.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: salonOrderController.orderHistoryList.length,
                          itemBuilder: (context, index) {
                            final order = salonOrderController.orderHistoryList[index];
                            return InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    insetPadding: EdgeInsets.all(8),
                                    contentPadding: EdgeInsets.all(8),
                                    title: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 32,
                                            color: Colors.black,
                                          )),
                                    ),
                                    content: SizedBox(
                                        width: 500.w, child: AlertSalonHome()),
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(TextSpan(
                                                text: order.outlet?.name ?? "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: order.user?.name ?? "",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: AppColors.primary),
                                                  )
                                                ])),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                CustomImage(
                                                    imageSrc: AppIcons.starIcon),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: "5/5",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.primary,
                                                  bottom: 8,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                CustomImage(
                                                    imageSrc: AppIcons.sal_clock),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomText(
                                                  text: order.createdAt?.toString() ?? "",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black_50,
                                                  bottom: 8,
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    CustomImage(
                                                        imageSrc:
                                                        AppIcons.rectangle1),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    CustomText(
                                                      text: "Past",
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.greenColor,
                                                      bottom: 8,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        CustomText(
                                          text: order.service?.price?.amount
                                              ?.toString() ??
                                              "",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greenColor,
                                          bottom: 8,
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      ]);
              }
            },
          ),
        ),
      ),
    );
  }
}

