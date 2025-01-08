import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_model/profile_model.dart';

class ProfileController extends GetxController {
  RxBool firstValue = false.obs;

  ///============================ Get Profile Image=========================
  final ImagePicker pickerCover = ImagePicker();
  //File? imagePath;
  RxString profileImage = "".obs;
  Future<void> getCoverImage() async {
    try {
      final XFile? pickedFile =
          await pickerCover.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Convert XFile to File if needed
        profileImage.value = pickedFile.path; // Ensure the file path is valid
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  RxString selectGender = "Gender".obs;
  RxInt currentIndex = 0.obs;
  List<String> selectItem = [
    "Male",
    "Female",
  ];

  ///=====================GET PROFILE INFO=====================
  final profileLoading = Status.loading.obs;
  void setProfileInfo(Status value) => profileLoading.value = value;

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Future<void> getProfileInfo() async {
    final userId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.getProfile(userId: userId));

    if (response.statusCode == 200) {
      profileModel.value = ProfileModel.fromJson(response.body['data']);

      initProfileInfoTextField(profileModel.value);

      setProfileInfo(Status.completed);

      refresh();

      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        setProfileInfo(Status.internetError);
      } else {
        setProfileInfo(Status.error);
      }

      ApiChecker.checkApi(response);
      refresh();
    }
  }

  ///=====================UPDATE PROFILE INFO=====================
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  Rx<TextEditingController> genderController = TextEditingController().obs;

  initProfileInfoTextField(ProfileModel model) {
    fullNameController.value.text = model.fullName ?? "";
    phoneNumberController.value.text = model.phone ?? "";
    addressController.value.text = model.address ?? "";
    //dateOfBirthController.value.text = model.dateOfBirth.toString() ?? "";
    dateOfBirthController.value.text =
      model.dateOfBirth ??'';
    genderController.value.text = model.gender ?? "";
  }

  //=====================UPDATE PROFILE INFO=====================
  RxBool updateProfileLoading = false.obs;
  Future<void> updateProfileInfo() async {
    final userId = await SharePrefsHelper.getString(AppConstants.userId);
    updateProfileLoading.value = true;
    refresh();
    Map<String, dynamic> body = {
      "name": fullNameController.value.text,
      "phone": phoneNumberController.value.text,
      "address": addressController.value.text,
      "gender": genderController.value.text == "Male" ?'male':'female',
      "dateOfBirth": dateOfBirthController.value.text,
    };
    Map<String, String> body2 = { 

      "name": fullNameController.value.text,
      "phone": phoneNumberController.value.text,
      "address": addressController.value.text,
      "gender": genderController.value.text == "Male" ?'male':'female',
      "dateOfBirth": dateOfBirthController.value.text ,
    };
    // ignore: unnecessary_null_comparison
    var response = profileImage.value.isEmpty
        ? await ApiClient.patchData(
            ApiUrl.updateProfile(userId: userId), jsonEncode(body))
        : await ApiClient.patchMultipartData(
            ApiUrl.updateProfileImage(userId: userId), body2,
            multipartBody: [MultipartBody('image', File(profileImage.value))]);
    if (response.statusCode == 200) {
      updateProfileLoading.value = false;
      profileImage.value = ""; 
      getProfileInfo();
      profileModel.refresh();
      refresh();
      Get.offAllNamed(AppRoutes.profileScreen);
    } else {
      updateProfileLoading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }

  @override
  onInit() {
    getProfileInfo();
    super.onInit();
  }
}
