
// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_earning/earnign_controller.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/salon_home_controller.dart';

class SalonEarningScreen extends StatefulWidget {
  const SalonEarningScreen({super.key});

  @override
  State<SalonEarningScreen> createState() => _SalonEarningScreenState();
}

class _SalonEarningScreenState extends State<SalonEarningScreen> {

  final earningController = Get.put(EarnignController());

  double totalAmount=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.earning),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Obx(
          () {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  earningController.earnignShowList.value.weeklyEarning!=null ?
                  SizedBox(
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  CustomText(
                                    text: "Weekly earning",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greenColor,
                                    bottom: 10.h,
                                  ),

                                  CustomText(
                                    text: "${earningController.earnignShowList.value.weeklyEarning?.amount}\$",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greenColor,
                                    bottom: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  CustomText(
                                    text: "Total earning",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black_50,
                                    bottom: 10.h,
                                  ),

                                  CustomText(
                                    text: "${earningController.earnignShowList.value.totalEarning?.amount}\$",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black_50,
                                    bottom: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ): CustomText(
                    text: "Earning Not Found..",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    bottom: 10.h,
                  ),



                  SizedBox(
                    height: 12.h,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomImage(imageSrc: AppIcons.earning2),

                      SizedBox(
                        width: 12.h,
                      ),
                      CustomText(
                        text: "My Earning",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                        bottom: 10.h,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 24),
                      decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child:earningController.completedShowList.isEmpty?
                      Center(
                        child: CustomText(
                          text: "My Earning is not available",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ):ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                        itemCount: earningController.completedShowList.length,
                        itemBuilder: (context, index) {
                    
                          final model = earningController.completedShowList[index];
                    
                          if(model.service?.serviceId?.discount?.type=="percentage"){
                    
                            double originalPrice = double.parse(model.service?.price?.amount.toString() ??"0.0");
                    
                            double discountPercentage = double.parse(model.service?.serviceId?.discount?.amount.toString() ??"0.0");
                    
                            double discountAmount = (originalPrice * discountPercentage) / 100;
                    
                            totalAmount = (originalPrice - discountAmount);
                    
                          }else{
                    
                            double originalPrice = double.parse(model.service?.price?.amount.toString() ??"0.0");
                            double discountPercentage = double.parse(model.service?.serviceId?.discount?.amount.toString() ??"0.0");
                    
                            totalAmount = (originalPrice - discountPercentage);
                          }
                    
                    
                          return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                    
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "${model.service?.name}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black_50,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CustomText(
                                        text: "${model.paymentType}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                    
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [

                                      CustomText(
                                        text: "${DateConverter.dateFormetString("${model.date}")} -${model.time}",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.homePopupTextColor3,
                                      ),
                    
                                      SizedBox(
                                        height: 8.h,
                                      ),
                    
                                      CustomText(
                                        text: "$totalAmount\$",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  )
                                ],
                              ));
                        },
                      ),
                    
                    ),
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
}
