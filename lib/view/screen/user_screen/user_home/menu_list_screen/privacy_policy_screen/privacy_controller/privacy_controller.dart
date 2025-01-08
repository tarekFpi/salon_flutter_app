import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/about_us_screen/about_model/about_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/privacy_policy_screen/privacy_model/privacy_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/menu_list_screen/terms_conditions_screen/terms_model/terms_model.dart';

class PrivacyController extends GetxController {
  RxBool isCheck = false.obs;



  //=========================== Get Privacy Policy ===============================//
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }
  Rx<PrivacyModel> privacyModel = PrivacyModel().obs;
  Future<void> getPrivacyPolicy() async {
    var response = await ApiClient.getData(ApiUrl.privacyPolicy);
    if (response.statusCode == 200) {
      try {
        rxRequestStatus.value = Status.completed;
        var data = response.body["data"];
        privacyModel.value = PrivacyModel.fromJson(data);
        debugPrint(
            '======================================>Profile Image ${privacyModel.value.toJson()}');
        refresh();
      } catch (e) {
        // Catch parsing issues
        setRxRequestStatus(Status.error);
        debugPrint("Parsing error: $e");
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  //=========================== Get Terms & Conditions ===============================//
  final rxTermsStatus = Status.loading.obs;
  void setTermsStatus(Status value) {
    rxTermsStatus.value = value;
  }
  Rx<TermModel> termsModel = TermModel().obs;
  Future<void> getTermsConditions() async {
    var response = await ApiClient.getData(ApiUrl.termsCondition);
    if (response.statusCode == 200) {
      try {
        rxTermsStatus.value = Status.completed;
        var data = response.body["data"];
        termsModel.value = TermModel.fromJson(data);
        debugPrint(
            '======================================>Profile Image ${termsModel.value.toJson()}');
        refresh();
      } catch (e) {
        // Catch parsing issues
        setTermsStatus(Status.error);
        debugPrint("Parsing error: $e");
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setTermsStatus(Status.internetError);
      } else {
        setTermsStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }


  //=========================== Get About US ===============================//
  final rxAboutStatus = Status.loading.obs;
  void setAboutStatus(Status value) {
    rxTermsStatus.value = value;
  }
  Rx<AboutModel> aboutModel = AboutModel().obs;
  Future<void> getAboutUs() async {
    var response = await ApiClient.getData(ApiUrl.aboutUs);
    if (response.statusCode == 200) {
      try {
        rxAboutStatus.value = Status.completed;
        var data = response.body["data"];
        aboutModel.value = AboutModel.fromJson(data);
        debugPrint(
            '======================================>Profile Image ${aboutModel.value.toJson()}');
        refresh();
      } catch (e) {
        // Catch parsing issues
        setAboutStatus(Status.error);
        debugPrint("Parsing error: $e");
        refresh();
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setAboutStatus(Status.internetError);
      } else {
        setAboutStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }



  @override
  void onInit() {
    getPrivacyPolicy();
    getTermsConditions();
    getAboutUs();
    super.onInit();
  }
}
