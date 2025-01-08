// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/service_details_screen/inner_widget/custom_sercice_container.dart';
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.offers),
      body: Column(
        children: List.generate(4, (index){return CustomSerciceContainer();}),
      ),
    );
  }
}
