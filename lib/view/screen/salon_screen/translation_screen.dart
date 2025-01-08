

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:google_cloud_translation/google_cloud_translation.dart';
import 'package:salon_booking_app/view/screen/salon_screen/TranslationService.dart';
import 'package:google_cloud_translation/google_cloud_translation.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {

  var translatedText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: "Translation"),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              ///================== by scanning the QR Image ===================//
              CustomText(
                text: "value:${translatedText}",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.bdColor,
                bottom: 10.h,
              ),

              CustomButton(onTap: () async{

                final translator = GoogleTranslator();
                  translatedText = await translator.translateToBangla('Hello, how are you?');

                  setState(() {

                  });
              },title: "GoogleTranslator",),

            ]
        ),
      ),


    );
  }
}

