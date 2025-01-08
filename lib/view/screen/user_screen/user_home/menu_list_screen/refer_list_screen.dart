// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/inner_widget/custom_refer_list.dart';

class ReferListScreen extends StatelessWidget {
  const ReferListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.referList),
      body: Column(
        children: List.generate(6, (index){return CustomReferList(
          imageUrl: AppConstants.profileImage,
          name: "Mehedi ",
          point: "20",
        );}),
      ),
    );
  }
}
