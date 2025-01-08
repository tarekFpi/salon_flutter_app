import 'dart:convert';
import 'package:get/get.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';

class ServicesMapController extends GetxController{
  RxBool isMaploading = false.obs;
  Future<void> loadMap() async {
    isMaploading.value = true;
    refresh();
    var body = {
      "farmacies": {
        "latitude": 23.7617,
        "longitude": 90.4313,
        "radius": 5
      }
    };
    final bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);

    var response =
    await ApiClient.postData(
        ApiUrl.farmaciesNearby, jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': bearerToken
    });
    if (response.statusCode == 200) {
      isMaploading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        isMaploading.value = false;
      }
    }
  }
}