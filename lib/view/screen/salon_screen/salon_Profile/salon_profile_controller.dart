
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_profile/model/SalonProfileShowResponseModel.dart';

class SalonProfileController extends GetxController {

  ///======================================>> edit user image photo  <<================================

  final ImagePicker _picker = ImagePicker();
  //File? imagePath;
  var profileImage = "".obs;

  Future<void> editUserImage() async {
    try {

      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        /// Convert XFile to File if needed

        profileImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  ///======================================>> picker Cover photo  <<================================

  final ImagePicker pickerCover = ImagePicker();
  //File? imagePath;
  RxString coverImage = "".obs;

  Future<void> getCoverImage() async {
    try {
      final XFile? pickedFile =
      await pickerCover.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        coverImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  ///======================================>> picker User photo  <<================================

  final ImagePicker pickerUserPhoto = ImagePicker();
  //File? imagePath;
  RxString userPhotoImage = "".obs;

  Future<void> getUserPhotoChane() async {
    try {
      final XFile? pickedFile =
      await pickerUserPhoto.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        userPhotoImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  ///======================================>> users-profile-show <<================================

  Rx<SalonProfileShowResponseModel> userProfileShow = SalonProfileShowResponseModel().obs;

  Future<void> userInformationShow() async {

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId= await SharePrefsHelper.getString(AppConstants.userId);

  var response = await ApiClient.getData(ApiUrl.salonProfileShow(outletId: outletId));

    if (response.statusCode == 200) {

      userProfileShow.value = SalonProfileShowResponseModel.fromJson(response.body["data"]);


      SharePrefsHelper.setString(AppConstants.outletName, userProfileShow.value.name);

      SharePrefsHelper.setString(AppConstants.outletType, userProfileShow.value.type);

      debugPrint("userProfileResponseModel:${userProfileShow.value.toJson()}");

      EasyLoading.dismiss();
      refresh();

    } else {

      EasyLoading.dismiss();
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


  ///======================================>> users-profile-update <<================================

  Rx<TextEditingController> nameController = TextEditingController().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;

  Rx<TextEditingController> addressController = TextEditingController().obs;

  Rx<TextEditingController> nidNumberController = TextEditingController().obs;

  Rx<TextEditingController> bankAccountController = TextEditingController().obs;

  Rx<TextEditingController> experienceController = TextEditingController().obs;

  Rx<TextEditingController> aboutController = TextEditingController().obs;

 /// Rx<TextEditingController> imageController = TextEditingController().obs;

   Future<void> userInformationUpdate() async {

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var body = {
      "name": nameController.value.text,
      "phone": phoneNumberController.value.text,
      "address": addressController.value.text,
      "nidNumber":nidNumberController.value.text,
      //"nidImage": profileImage.value,
      "bankAccountNumber": bankAccountController.value.text,
      "experience": experienceController.value.text,
      "about": aboutController.value.text,
    };



   var response = await ApiClient.patchMultipartData(ApiUrl.userProfileUpdate(outletId: outletId), body,
        multipartBody: [MultipartBody('nidImage', File(profileImage.value))]);


    if (response.statusCode == 200) {

      showCustomSnackBar("undefined updated successfully", isError: false);

      EasyLoading.dismiss();

      debugPrint("body:${response}");

      nameController.value.text="";
      phoneNumberController.value.text="";
      addressController.value.text="";
      nameController.value.text="";
      nidNumberController.value.text="";
      bankAccountController.value.text="";
      experienceController.value.text="";
      aboutController.value.text="";

      refresh();

    } else {

      EasyLoading.dismiss();
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);

        return;
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


  ///======================================>> cover Photos update <<================================
  Future<void> changeCoverPhotos() async {

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var body = {
      "name": "",
    };

    var response = await ApiClient.patchMultipartData(ApiUrl.coverPhotosUpdate(outletId: outletId), body,
        multipartBody: [MultipartBody('coverImage', File(coverImage.value))]);

    if (response.statusCode == 200) {

      showCustomSnackBar("Cover image change Successfully", isError: false);

      EasyLoading.dismiss();

      userInformationShow();

      coverImage.value="";

      userProfileShow.refresh();

      refresh();

    } else {

      EasyLoading.dismiss();
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);

        return;
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


 ///======================================>> user Photos update api <<================================
  Future<void>  changeUserPhoto() async {

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    var  outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var body = {
      "name": "",
    };

    var response = await ApiClient.patchMultipartData(ApiUrl.userPhotosUpdate(outletId: outletId), body,
        multipartBody: [MultipartBody('profileImage', File(userPhotoImage.value))]);

    if (response.statusCode == 200) {

      showCustomSnackBar("Profile image change successful", isError: false);

      EasyLoading.dismiss();

      userInformationShow();

      userProfileShow.refresh();

      userPhotoImage.value="";

      refresh();

    } else {

      EasyLoading.dismiss();
      refresh();
      if (response.statusText == ApiClient.somethingWentWrong) {
        showCustomSnackBar(AppStrings.checknetworkconnection, isError: true);
        ApiChecker.checkApi(response);

        return;
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(response);
        return;
      }
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userInformationShow();
  }
}