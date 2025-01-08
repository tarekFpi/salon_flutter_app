
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SalonQrScreen extends StatefulWidget {
    SalonQrScreen({super.key});

  @override
  State<SalonQrScreen> createState() => _SalonQrScreenState();
}

class _SalonQrScreenState extends State<SalonQrScreen> {

  var argumentData = Get.arguments;

  String qrData="";

  Map<String, String>? data;

  @override
  void initState() {
    super.initState();

    if (argumentData != "") {
      var serviceName = argumentData[0]["service_name"];
      var servicePrice = argumentData[0]["price"];
      String outletId = argumentData[0]["outletId"];

     data = {
        'Name': serviceName,
        'price': servicePrice,
        'Id': outletId,
      };
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(appBarContent: AppStrings.generateQr),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ///================== by scanning the QR Image ===================//
            /// Center(child: Image.asset(AppImages.qr_image)),


            Center(
              child: QrImageView(
                data: data.toString(),
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),


           /* Column(
           children: [
            Align(
               alignment: Alignment.topCenter,
               child: CustomText(
                 text: AppStrings.generateQr,
                 fontSize: 22,
                 fontWeight: FontWeight.w600,
                 color: AppColors.bdColor,
                 bottom: 10.h,
               ),
             ),

              Align(
               alignment: Alignment.topCenter,
               child: CustomText(
                 text: "Your order will be confirmed ",
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                 color: AppColors.neutral03,
                 bottom: 8.h,
               ),
             ),

             ///================== by scanning the QR Code ===================//
             Align(
               alignment: Alignment.topCenter,
               child: CustomText(
                 text: "by scanning the QR Code",
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                 color: AppColors.primary,
                 bottom: 8.h,
               ),
             ),
           ],
         ),*/


 ]
  ),
      ),


    );
  }
}
