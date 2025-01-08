

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
import 'package:salon_booking_app/view/screen/salon_screen/salon_reviews/model/ReviewResponseModel.dart';

class ReviewController  extends GetxController {



  ///======================================>> Retrive upComming Booking  api <<================================

  RxList<ReviewResponseModel> reviewShowList = <ReviewResponseModel>[].obs;

  Future<void> reviewShow() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.feedbackReview(outletId: outletId));

    if (response.statusCode == 200) {

      reviewShowList.value = List.from(response.body["data"].map((m)=> ReviewResponseModel.fromJson(m)));

      debugPrint("upCommingShowList:${reviewShowList.toJson()}");

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



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    reviewShow();
  }


}