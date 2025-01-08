// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/privacy_policy_screen/privacy_controller/privacy_controller.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final PrivacyController privacyController = Get.find<PrivacyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.aboutUs),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            switch (privacyController.rxAboutStatus.value) {
              case Status.loading:
                return Center(
                  child: CustomLoader(),
                );
              case Status.internetError:
                return Center(
                  child: CustomLoader(),
                );
              case Status.error:
                return GeneralErrorScreen(
                    onTap: () => privacyController.getAboutUs());
              case Status.completed:
                return Column(
                  children: [
                    HtmlWidget(
                      privacyController.aboutModel.value.description != null
                          ? privacyController.aboutModel.value.description!
                          : '',
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
