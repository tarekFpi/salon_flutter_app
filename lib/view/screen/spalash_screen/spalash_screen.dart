// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';

import '../../../utils/app_images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.delayed(  Duration(seconds: 3), () async{

        var token = await SharePrefsHelper.getString(AppConstants.bearerToken);

        var role = await SharePrefsHelper.getString(AppConstants.role);

        if(token.isEmpty){
          Get.offAllNamed(AppRoutes.loginScreen);

        }else if(role.isNotEmpty && token.isNotEmpty){

          Get.offAllNamed(AppRoutes.salonHomeScreen);
        }else{

          Get.offAllNamed(AppRoutes.userHomePage);
        }

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SvgPicture.asset(
          AppImages.splashScreen,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
