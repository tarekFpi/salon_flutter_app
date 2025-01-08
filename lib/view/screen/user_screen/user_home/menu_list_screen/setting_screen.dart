// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  final storage = GetStorage();

  int selectedRadio = 0;

  String status = "";

  void  languageDialog() {

    showDialog<void>(
        context: context,
        builder: (BuildContext context)=>
            AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Positioned(
                          right:-20,
                          top: -20,
                          child: IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.close))),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            RadioListTile(
                              title: Text("Arb"),
                              value: "Arb",
                              groupValue: status,
                              onChanged: (value){
                                setState(() {

                                  status =value!;
                                  Get.updateLocale(Locale('ar', 'AE'));

                                  storage.write("key","ar");
                                  Navigator.of(context).pop();
                                });
                              },
                            ),

                            RadioListTile(
                              title: Text("English"),
                              value: "English",
                              groupValue: status,
                              onChanged: (value){
                                setState(() {
                                  status =value!;
                                  Get.updateLocale(Locale('en', 'US'));
                                  storage.write("key","en");
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.settings),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
        child: Column(
          children: [
            ///================== language ===================//
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    languageDialog();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.language),
                      SizedBox(width: 10.w,),
                      CustomText(
                        text: AppStrings.language,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black_50,
                      ),
                    ],
                  ),
                ),
                CustomText(
                  text: AppStrings.english,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black_50,
                ),
              ],
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 1.h,
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.neutral03,
            ),
            ///================== Change Password ===================//
            SizedBox(height: 30.h,),
            Row(
              children: [
                Icon(Icons.lock),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                  child: CustomText(
                    text: "chane_password".tr,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black_50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 1.h,
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.neutral03,
            ),

            ///================== Delete Account ===================//
            SizedBox(height: 30.h,),
            Row(
              children: [
                Icon(Icons.lock),
                SizedBox(width: 10.w,),
                CustomText(
                 // text: AppStrings.deleteAccount,
                  text: "delete_account".tr,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black_50,
                ),
              ],
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 1.h,
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.neutral03,
            ),
          ],
        ),
      ),
    );
  }
}
