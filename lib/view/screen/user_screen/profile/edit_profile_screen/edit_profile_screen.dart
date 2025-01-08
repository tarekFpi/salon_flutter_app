// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_popupmenu_button/custom_popupmenu_button.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final ProfileController profileController = Get.find<ProfileController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.editProfile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
          child: Form(
            key: formKey,
            child: Obx(() {
              return Column(
                children: [
                  Center(
                      child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            border:
                                Border.all(width: 3, color: AppColors.primary),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                // ignore: deprecated_member_use
                                color: AppColors.white.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Stack(
                            fit: StackFit.loose,
                            clipBehavior: Clip.none,
                            children: [
                              // ignore: unnecessary_null_comparison
                              profileController.profileImage.value.isEmpty
                                  ? profileController
                                                  .profileModel.value.image !=
                                              null &&
                                          profileController.profileModel.value
                                              .image!.isNotEmpty
                                      ? CustomNetworkImage(
                                          imageUrl:  '${ApiUrl.imageUrl}${profileController.profileModel.value.image ??''}',
                                          height: 120.h,
                                          width: 120.w,
                                          boxShape: BoxShape.circle,
                                        )
                                      : CustomNetworkImage(
                                          imageUrl: AppConstants.profileImage,
                                          height: 120.h,
                                          width: 120.w,
                                          boxShape: BoxShape.circle,
                                        )
                                  : Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: FileImage(
                                              File(
                                                profileController
                                                    .profileImage.value,
                                              ),
                                            ),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                              Positioned(
                                bottom: 5,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    profileController.getCoverImage();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),

                  ///================== name ===================//
                  CustomFormCard(
                    hintText: AppStrings.fullName,
                    title: AppStrings.fullName,
                    controller: profileController.fullNameController.value,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),

                  ///================== phoneNumber ===================//
                  CustomFormCard(
                    hintText: AppStrings.phoneNumber,
                    title: AppStrings.phoneNumber,
                    controller: profileController.phoneNumberController.value,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),

                  ///================== address ===================//
                  CustomFormCard(
                    hintText: AppStrings.address,
                    title: AppStrings.address,
                    controller: profileController.addressController.value,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),

                  ///================== dateOfBirth ===================//
                  CustomFormCard(
                    suffixIcon: Icon(Icons.calendar_month),
                    hintText: AppStrings.dateOfBirth,
                    title: AppStrings.dateOfBirth,
                    //controller: DateConverter.timeFormetString(profileController.profileModel.value.dateOfBirth.toString()),
                    controller: profileController.dateOfBirthController.value,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return AppStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                  ),

                  ///================== gender ===================//

                  // CustomDropdown(
                  //   currentItem: profileController.selectGender.value,
                  //   items: profileController.selectItem.value,
                  //   onChanged: (value){
                  //     profileController.selectGender.value = value!;
                  //   },

                  //   ),

                  CustomFormCard(
                    readOnly: true,
                    suffixIcon: CustomPopupmenuButton(
                      onChanged: (value) {
                        // profileController.currentIndex.value = value;
                        profileController.selectGender.value = value;
                        profileController.genderController.value.text = value;
                      },
                      items: profileController.selectItem,
                      icons: Icons.keyboard_arrow_down_rounded,
                    ),
                    hintText: AppStrings.gender,
                    title: AppStrings.gender,
                    controller: profileController.genderController.value,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///================== Button ===================//
                  profileController.updateProfileLoading.value
                      ? CustomLoader()
                      : CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              profileController.updateProfileInfo();
                            }
                          },
                          title: AppStrings.saveChange,
                        )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
