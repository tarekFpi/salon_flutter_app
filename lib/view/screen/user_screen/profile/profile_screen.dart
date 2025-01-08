import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_appbar_two.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/inner_widget/custom_review_name.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarTwo(appBarContent: AppStrings.myProfile),
      body: LayoutBuilder(
        // Added LayoutBuilder for constraints
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Obx(() {
                  switch (profileController.profileLoading.value) {
                    case Status.loading:
                      return const Center(child: CustomLoader());
                    case Status.internetError:
                       return GeneralErrorScreen(
                        onTap: () => profileController.getProfileInfo(),
                      );
                    case Status.error:
                      return GeneralErrorScreen(
                        onTap: () => profileController.getProfileInfo(),
                      );
                    case Status.completed:
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: profileController.profileModel.value.image !=
                                          null &&
                                      profileController
                                          .profileModel.value.image!.isNotEmpty
                                  ? CustomNetworkImage(
                                      imageUrl:'${ApiUrl.imageUrl}${profileController.profileModel.value.image ??''}', // Fallback
                                      boxShape: BoxShape.circle,
                                      height: 130.h,
                                      width: 130.w,
                                    )
                                  : CustomNetworkImage(
                                      imageUrl: AppConstants.profileVector,
                                      boxShape: BoxShape.circle,
                                      height: 130.h,
                                      width: 130.w,
                                    ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomText(
                                top: 10,
                                text: profileController
                                        .profileModel.value.fullName ??
                                    "",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black_50,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomImage(imageSrc: AppIcons.flaticon),
                                const SizedBox(width: 10),
                                CustomText(
                                  top: 10,
                                  text: '${profileController.profileModel.value.point??'0'}',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  top: 10,
                                  text: AppStrings.profile,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                  bottom: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.editProfileScreen);
                                  },
                                  icon: const Icon(
                                    Icons.edit_note,
                                    color: AppColors.primary,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: 20),
                            CustomReviewName(
                              title: "Name",
                              name: profileController
                                      .profileModel.value.fullName?.tr ??
                                  "",
                            ),
                            CustomReviewName(
                              title: "Email",
                              name: profileController.profileModel.value.email ??
                                  "",
                            ),
                            CustomReviewName(
                              title: "Address",
                              name:
                                  profileController.profileModel.value.address ??
                                      "update your profile",
                            ),
                            CustomReviewName(
                              title: "Phone Number",
                              name: profileController.profileModel.value.phone ??
                                  "",
                            ),
                            CustomReviewName(
                              title: "Date of Birth",
                              name: profileController.profileModel.value.dateOfBirth == null ? "Update your profile" : DateConverter.timeFormetString(
                                profileController.profileModel.value.dateOfBirth ??'2024-12-10T11:00:36.999Z'
                                        ,
                              ),
                            ),
                            CustomReviewName(
                              title: "Gender",
                              name: profileController.profileModel.value.gender ??
                                  "update your profile",
                            ),
                          ],
                        ),
                      );
                  }
                }),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const NavBar(currentIndex: 4),
    );
  }
}
