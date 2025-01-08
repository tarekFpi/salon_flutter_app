import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';

class UserAuthController extends GetxController {
  ///====================USER REGISTER CONTROLLER==================
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  //=====================USER REGISTER METHOD=====================
  RxBool userRegisterLoading = false.obs;
  Future<void> userRegister() async {
    userRegisterLoading.value = true;
    refresh();
    var body = {
      "fullName": fullNameController.value.text,
      "email": emailController.value.text,
      "phone": phoneNumberController.value.text,
      "password": passwordController.value.text,
      "referralCode": null,
      "isSocial": false,
      "fcmToken": null
    };
    var response =
        await ApiClient.postData(ApiUrl.userRegister, jsonEncode(body));
    if (response.statusCode == 201) {
      userRegisterLoading.value = false;
      refresh();
      showCustomSnackBar(response.body['message']!, isError: false);
      Get.offAllNamed(AppRoutes.singUpSendCode,
          arguments: UserModel(
            emailController.value.text,
            AppStrings.register,
          ));
      clearUserRegisterTextFields();
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: false);
        return;
      } else {
        ApiChecker.checkApi(response);
        userRegisterLoading.value = false;
        refresh();
        return;
      }
    }
  }

  //=========== CLEAR USER REGITER TEXT FIELDS =============
  clearUserRegisterTextFields() {
    fullNameController.value.clear();
    emailController.value.clear();
    phoneNumberController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
  }

  ///======================VALITATION CONTROLLER=====================
  Rx<TextEditingController> otpController = TextEditingController().obs;
  //=====================VALITATION METHOD=====================
  RxBool otpLoading = false.obs;
  Future<void> otpValidation(
      {required String email, required String screenName}) async {
    otpLoading.value = true;
    refresh();
    var body = {
      "email": email,
      "otp": otpController.value.text,
    };
    var response = await ApiClient.postData(ApiUrl.otpVerify, jsonEncode(body));
    if (response.statusCode == 200) {
      otpLoading.value = false;
      refresh();
      showCustomSnackBar(response.body['message']!, isError: false);
      if (screenName == AppStrings.forgotPassword) {
        Get.offAllNamed(AppRoutes.resetPasswordScreen,
            arguments: UserModel(email, AppStrings.resetPassword));
      } else if (screenName == AppStrings.register) {
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        Get.offAllNamed(AppRoutes.userHomePage);
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        otpLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        otpLoading.value = false;
        refresh();
        return;
      }
    }
  }

  ///====================FORGET PASSWORD CONTROLLER==================
  Rx<TextEditingController> forgetEmailController = TextEditingController().obs;
  //================= FORGET PASSWORD METHOD================
  RxBool forgetPasswordLoading = false.obs;
  Future<void> forgetPassword(
      {required bool isForgot, required String email}) async {
    forgetPasswordLoading.value = true;
    refresh();
    var body = {"email": email};
    var response =
        await ApiClient.postData(ApiUrl.mailForgetOtp, jsonEncode(body));
    if (response.statusCode == 200) {
      forgetPasswordLoading.value = false;
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]);
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
      if (isForgot) {
        Get.offAllNamed(AppRoutes.singUpSendCode,
            arguments: UserModel(
              forgetEmailController.value.text,
              AppStrings.forgotPassword,
            ));
      } else {
        Get.offAllNamed(AppRoutes.singUpSendCode,
            arguments: UserModel(email, AppStrings.logIn));
      }
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        forgetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        forgetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }

  ///====================RESET PASSWORD CONTROLLER==================
  Rx<TextEditingController> resetNewPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> resetConfirmPasswordController =
      TextEditingController().obs;
  //================= RESET PASSWORD METHOD================
  RxBool resetPasswordLoading = false.obs;
  Future<void> restPassword({required String email}) async {
    resetPasswordLoading.value = true;
    refresh();
    var body = {
      "email": email,
      "newPassword": resetNewPasswordController.value.text,
    };
    var response =
        await ApiClient.postData(ApiUrl.resetPassword, jsonEncode(body));
    if (response.statusCode == 200) {
      resetPasswordLoading.value = false;
      refresh();
      showCustomSnackBar(response.body['message']!, isError: false);
      Get.offAllNamed(AppRoutes.loginScreen,
          arguments:
              UserModel(forgetEmailController.value.text, AppStrings.register));
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        resetPasswordLoading.value = false;
        refresh();
        return;
      } else {
        ApiChecker.checkApi(response);
        resetPasswordLoading.value = false;
        refresh();
        return;
      }
    }
  }

  ///======================LOGIN CONTROLLER=====================

  Rx<TextEditingController> loginEmailController = TextEditingController(
    text: kDebugMode ? "sohiwori@mailinator.com" : "",
  ).obs;

  Rx<TextEditingController> loginPasswordController = TextEditingController(
    text: kDebugMode ? "12345678" : "",
  ).obs;

  ///=====================LOGIN METHOD=====================
  RxBool loginLoading = false.obs;

  Future<void> userLogin() async {
    loginLoading.value = true;
     refresh();
    var body = {
      "email": loginEmailController.value.text,
      "password": loginPasswordController.value.text,
      "isSocial": false,
      "fcmToken": null
    };
    var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));
    if (response.statusCode == 200) {
      loginLoading.value = false;
      refresh();
      showCustomSnackBar(response.body['message']!, isError: false);
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]["accessToken"]);
      SharePrefsHelper.setString(
          AppConstants.userId, response.body["data"]["_id"]);
      if (response.body["data"]["isVerified"] == false) {
        forgetPassword(isForgot: false, email: loginEmailController.value.text);
      } else {

        if (response.body["data"]["role"] == "outlet") {
          Get.offAllNamed(AppRoutes.salonHomeScreen);

          SharePrefsHelper.setString(
              AppConstants.role, response.body["data"]["role"]);
        } else {

          SharePrefsHelper.remove(AppConstants.role);
          Get.offAllNamed(AppRoutes.userHomePage);
        }
      }
    } else {
      loginLoading.value = false;
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        return;
      } else {
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


  // Future<void> userLogin() async {
  //   loginLoading.value = true;
  //   refresh();
  //   var body = {
  //     "email": loginEmailController.value.text,
  //     "password": loginPasswordController.value.text,
  //     "isSocial": false,
  //     "fcmToken": null
  //   };
  //   var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     loginLoading.value = false;
  //     refresh();
  //     showCustomSnackBar(response.body['message']!, isError: false);
  //     SharePrefsHelper.setString(
  //         AppConstants.bearerToken, response.body["data"]["accessToken"]);
  //     SharePrefsHelper.setString(
  //         AppConstants.userId, response.body["data"]["_id"]);
  //     if (response.body["data"]["isVerified"] == false) {
  //       forgetPassword(isForgot: false, email: loginEmailController.value.text);
  //     } else {
  //       Get.offAllNamed(AppRoutes.userHomePage);
  //     }
  //   } else {
  //     loginLoading.value = false;
  //     refresh();
  //     if (response.statusText == ApiClient.somethingWentWrong) {
  //       showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
  //       return;
  //     } else {
  //       ApiChecker.checkApi(response);
  //       return;
  //     }
  //   }
  // }
}

class UserModel {
  final String email;
  final String screenName;
  UserModel(this.email, this.screenName);
}
