
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
import 'package:salon_booking_app/view/screen/salon_screen/salon_earning/completed_model/CompletedEarningResponseModel.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_earning/model/EarningResponseModel.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_home_screen/model/upcommingShowResponseModel.dart';

class EarnignController  extends GetxController {


  ///======================================>> Earning Booking  api <<================================

  Rx<EarningResponseModel> earnignShowList = EarningResponseModel().obs;

  Future<void> earningShow() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.earningOutlet(outletId: outletId));

    if (response.statusCode == 200) {

      earnignShowList.value = EarningResponseModel.fromJson(response.body["data"]);

      debugPrint("earnignShowList:${earnignShowList.value}");

      EasyLoading.dismiss();

    }else if(response.statusCode == 400){

      earnignShowList.value = EarningResponseModel();
      EasyLoading.dismiss();

    }else {


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




  ///======================================>> Earning Booking completed api <<================================


  RxList<CompletedEarningResponseModel> completedShowList = <CompletedEarningResponseModel>[].obs;

  Future<void> completedShow() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.earningCompleted);

    if (response.statusCode == 200) {

      completedShowList.value = List.from(response.body["data"].map((m)=> CompletedEarningResponseModel.fromJson(m)));

      debugPrint("completedShowList:${completedShowList.value}");

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

    earningShow();

    completedShow();
  }


}