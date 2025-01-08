

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/model/upcommingShowResponseModel.dart';

class SalonHomeController  extends GetxController {

  var now = DateTime.now();

  RxString selectedDate="".obs;

  RxBool homeService = false.obs;

  void selectDate() async {

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!, initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(pickedDate != null ){

      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      selectedDate.value = formattedDate;

      upCommingBookingShow(selectedDate.value);

    }else{

      selectedDate.value="selected Date";

    }
  }



  ///======================================>> Retrive upComming Booking  api <<================================

  RxList<UpcommingShowResponseModel> upCommingShowList = <UpcommingShowResponseModel>[].obs;

  Future<void> upCommingBookingShow(String date) async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.upcommingBookingShow(outletId: outletId,date: date));

    if (response.statusCode == 200) {

      upCommingShowList.value = List.from(response.body["data"].map((m)=> UpcommingShowResponseModel.fromJson(m)));

      debugPrint("upCommingShowList:${upCommingShowList.toJson()}");

      EasyLoading.dismiss();

    } else {

      EasyLoading.dismiss();

      if (response.statusText == ApiClient.somethingWentWrong) {

        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);

        refresh();
        return;

      } else {

        ApiChecker.checkApi(response);

        refresh();
        return;
      }
    }
  }





}