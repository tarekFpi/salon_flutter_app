// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_reviews/review_controller.dart';



class SalonReviewsScreen extends StatefulWidget {
  const SalonReviewsScreen({super.key});

  @override
  State<SalonReviewsScreen> createState() => _SalonReviewsScreenState();
}

class _SalonReviewsScreenState extends State<SalonReviewsScreen> {

  final reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: AppStrings.reviews),
      body:Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          child: Obx(
            () {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
        
                    ///================== Salon Reviews  ListView ===================//
        
                    reviewController.reviewShowList.isEmpty?
                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: "Review Data is not available",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ): ListView.builder(
                      padding: EdgeInsets.only(top: 16),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: reviewController.reviewShowList.value.length,
                      itemBuilder: (context, index) {
        
                        final model = reviewController.reviewShowList[index];
        
                        return InkWell(
                          onTap: (){
        
                            ///================== Salon Reviews Edit Alert ===================//
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor:  Colors.white,
                                insetPadding: EdgeInsets.all(8),
                                contentPadding: EdgeInsets.all(0),
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
        
                                    CustomText(
                                      text: "",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      bottom: 5.h,
                                    ),
        
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            setState(() {
        
                                            });
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 32,
                                            color: Colors.black,
                                          )),
                                    )
                                  ],
                                ),
                                content: SizedBox(
                                    width: MediaQuery.of(context).size.width ,
                                    height: MediaQuery.of(context).size.height * 0.2,
                                   // child: SalonReviewAlert()),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          /// crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
        
                                            SizedBox(
                                              height: 8.h,
                                            ),
        
                                            ///================== review Special ===================//
        
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
        
                                                CustomText(
                                                  text: "${model.booking?.service?.name}",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black_50,
                                                  bottom: 8,
                                                ),
        
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
        
                                                    CustomImage(imageSrc: AppIcons.starIcon),
        
                                                    SizedBox(
                                                      width: 8.h,
                                                    ),
        
                                                      CustomText(
                                                      text: "${model.rating}",
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.black_50,
                                                      bottom: 8,
                                                    ),
                                                  ],
                                                ),
        
                                                CustomText(
                                                  text: "${model.comment}",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black_50,
                                                  overflow: TextOverflow.ellipsis,
                                                  bottom: 8,
                                                ),
        
                                              ],
                                            ),
        
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:   Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
        
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
        
                                          CustomText(
                                            text: "${model.booking?.service?.name}",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black_50,
                                            bottom: 8,
                                          ),
        
                                          SizedBox(
                                            width: 200,
                                            child: CustomText(
                                              text: "${model.comment}",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black_50,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
        
                                        ],
                                      ),
        
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
        
                                            CustomImage(imageSrc: AppIcons.starIcon),
        
                                            SizedBox(
                                              width: 4,
                                            ),
                                            CustomText(
                                             // text: "4.5/5",
                                              text: "${model.rating}",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black_50,
                                              bottom: 8,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ]
              );
            }
          ),
        ),
      ),
    );
  }
}
