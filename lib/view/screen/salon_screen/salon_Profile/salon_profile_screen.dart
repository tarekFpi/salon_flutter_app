// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_images/app_images.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_appbar_two.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/nav_bar/salon_nav.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_profile/salon_profile_controller.dart';

class SalonProfileScreen extends StatefulWidget {
  const SalonProfileScreen({super.key});

  @override
  State<SalonProfileScreen> createState() => _SalonProfileScreenState();
}

class _SalonProfileScreenState extends State<SalonProfileScreen> {


  final SalonProfileController salonProfileController = Get.find<SalonProfileController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppbarTwo(appBarContent: "Professional Profile"),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                 ///height: MediaQuery.sizeOf(context).height / 3,
                   width: MediaQuery.sizeOf(context).width,
                   decoration:   BoxDecoration(
                     ///borderRadius: BorderRadius.circular(8.0),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black26,
                         blurRadius: 2.0,
                         spreadRadius: 0.0,
                         offset: Offset(2.0, 2.0), // shadow direction: bottom right
                       )
                     ],
                   ),
                   // color: Colors.white,
                   child: Column(
                     children: [

                       SizedBox(
                         height: 200,
                         child: Stack(
                           clipBehavior: Clip.none,
                           children: [

                          salonProfileController.coverImage.value==""?
                           CustomNetworkImage(
                           imageUrl:
                           "${ApiUrl.imageUrl}${salonProfileController.userProfileShow.value.coverImage ?? ""}",
                           height: 150.h,
                           width: double.infinity,
                         //  boxShape: BoxShape.circle,
                          ) :Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(salonProfileController.coverImage.value),),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),


                                 Positioned(
                                   top: 40,
                                  right: 24,
                                 child: GestureDetector(
                                   onTap: (){
                                     salonProfileController.getCoverImage();
                                   },
                                 child:
                                 CustomImage(imageSrc: AppIcons.sa_camra))),


                             Positioned(
                               top: 80,
                               right: 0,
                               left: 0,
                               child: salonProfileController.userPhotoImage.value== ""
                                   ? CustomNetworkImage(
                                 imageUrl: "${ApiUrl.imageUrl}${salonProfileController.userProfileShow.value.profileImage}",
                                 height: 115,
                                 width: 115,
                                 boxShape: BoxShape.circle,
                                 border: Border.all(color: AppColors.primary, width: 2),
                               )
                                   : Container(
                                 height: 115,
                                 width: 115,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle, // Set to circle
                                  color: Colors.grey,
                                   border: Border.all(
                                     width: 1,
                                     color: AppColors.primary,
                                   ),
                                   image: DecorationImage(
                                     image: FileImage(File(salonProfileController.userPhotoImage.value)),
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                             ),


                             /*
                             Container(
                                 height: 115,
                                 width: 115,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   borderRadius: BorderRadius.only(
                                     topRight: Radius.circular(40),
                                   ),
                                   border: Border.all(
                                     width: 1,
                                     color: AppColors.primary,
                                     style: BorderStyle.solid,

                                   ),

                                     image: DecorationImage(
                                       image: FileImage(File(salonProfileController.coverImage.value),),
                                       fit: BoxFit.cover,
                                     ),

                                 ),
                               )*/

                             Positioned(
                                 top: 145.h,
                                 right: 130.h,
                                 child: GestureDetector(
                                     onTap: (){
                                       salonProfileController.getUserPhotoChane();
                                     },
                                     child: CustomImage(imageSrc: AppIcons.sa_camra))),

                           ],
                         ),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           CustomText(
                             text: "${salonProfileController.userProfileShow.value.name}",
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             color: AppColors.neutral03,
                             bottom: 10.h,
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               CustomImage(imageSrc: AppIcons.starIcon1,),

                               const SizedBox(
                                 width: 4,
                               ),
                               CustomText(
                                 text: "4.5/5",
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                                 color: AppColors.neutral03,
                                 bottom: 10.h,
                               ),

                             ],
                           ),

                         ],
                       )
                     ],
                   ),
                 ),
                SizedBox(
                  height: 16.h,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 22, top: 16),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.salonProfileEditScreen);
                        },
                        child: CustomImage(
                          imageSrc: AppIcons.salon_edit,
                        )),
                  ),
                ),

                ///================== Salon Name ===================//
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:   EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///================== Salon name ===================//
                        CustomText(
                          text: "Salon Name",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.name}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                        ),

                        ///================== Salon Email ===================//
                        CustomText(
                          text: "Email",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.email}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                        ),

                        ///================== Salon Phone number ===================//
                        CustomText(
                          text: "Phone number",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.phone}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                        ),

                        ///================== Salon Experience ===================//
                        CustomText(
                          text: "Experience",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.experience}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                        ),

                     ///================== About   ===================//
                        CustomText(
                          text: "About",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text:
                              "${salonProfileController.userProfileShow.value.about}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                          textAlign: TextAlign.start,
                        ),

                        ///================== Id card   ===================//
                        CustomText(
                          text: "Id card",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.nidNumber}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                          textAlign: TextAlign.center,
                        ),

                        ///================== Bank Account no.   ===================//
                        CustomText(
                          text: "Bank Account no.",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.bdColor,
                          bottom: 4.h,
                        ),

                        CustomText(
                          text: "${salonProfileController.userProfileShow.value.bankAccountNumber}",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50,
                          bottom: 10.h,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        ///================== change Cover Photos ===================//
                        if(salonProfileController.coverImage.value!= "")
                        Padding(
                          padding:   EdgeInsets.only(right: 12,bottom: 8),
                          child: CustomButton(onTap: (){

                            salonProfileController.changeCoverPhotos();
                          },title: AppStrings.change_coverPhoto,),
                        ),


                     ///================== change User Photos ===================//
                       if(salonProfileController.userPhotoImage.value!= "")
                          Padding(
                            padding: EdgeInsets.only(right: 12,bottom: 8),
                            child: CustomButton(onTap: (){

                             salonProfileController.changeUserPhoto();

                            },title: AppStrings.change_userPhoto),
                          ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: NavBarSalon(
        currentIndex: 2,
      ),
    );
  }
}
