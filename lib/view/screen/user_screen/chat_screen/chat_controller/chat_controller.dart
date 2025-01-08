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
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_image_add_send/custom_image_add_send_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/message_model/message_model.dart';
import 'package:salon_booking_app/view/screen/user_screen/profile/profile_controller/profile_controller.dart';

class ChatController extends GetxController {

  final ProfileController profileController = Get.find<ProfileController>();
  final CustomImageAddSendController customImageAddSendController =
      Get.find<CustomImageAddSendController>();
  RxList<String> messageTabList = <String>[
    AppStrings.profile,
    AppStrings.profile,
    AppStrings.profile,
  ].obs;
  RxInt tabCurrentIndex = 0.obs;

  ///====================== Get Message ======================
  Rx<Status> messageStatusLoading = Status.loading.obs;
  RxList<MessageModel> messageList = <MessageModel>[].obs;

  Future<void> getMessage() async {
    final conver = await SharePrefsHelper.getString(AppConstants.conversationId);
    debugPrint('=============Conversiton=================$conver');
    var response =
        await ApiClient.getData(ApiUrl.getMessage(conversationId: conver));

    if (response.statusCode == 201) {
      var data = response.body["data"];
      messageList.value =
          List<MessageModel>.from(data.map((x) => MessageModel.fromJson(x)));
      messageStatusLoading.value = Status.completed;
      refresh();
    } else {
      if (response.statusText == ApiClient.somethingWentWrong) {
        messageStatusLoading.value = Status.internetError;
        refresh();
      } else {
        messageStatusLoading.value = Status.error;
        refresh();
      }
      ApiChecker.checkApi(response);
      refresh();
    }
  }

  Rx<TextEditingController> messageController = TextEditingController().obs;

  ///====================== Post Message =====================
  RxBool messageSendLoading = false.obs;
  Future<void> sendMessage({
    required String message,
  }) async {
    // messageStatusLoading.value = Status.loading;
    final userId = await SharePrefsHelper.getString(AppConstants.userId);
    final conver = await SharePrefsHelper.getString(AppConstants.conversationId);
    refresh();
    Map<String, String> body = {
      "conversation": conver,
      "sender": userId,
      "senderRole": "user",
      "type": "text",
      "content": message,
    };
    Map<String, String> body2 = {
      "conversation": conver,
      "sender": userId,
      "senderRole": "user",
      "type": "attachment",
      "content": message.isEmpty ? "" : message,
    };
    List<MultipartBody> multipartBody = [];
    if (customImageAddSendController.images.isNotEmpty) {
      for (int i = 0; i < customImageAddSendController.images.length; i++) {
        multipartBody.add(MultipartBody(
            'attachment', File(customImageAddSendController.images[i].path)));
      }
    }

    var response = customImageAddSendController.images.isNotEmpty
        ? await ApiClient.postMultipartData(ApiUrl.sendMessage, body2,
            multipartBody: multipartBody)
        : await ApiClient.postData(ApiUrl.sendMessage, jsonEncode(body));
    if (response.statusCode == 201) {
      // showCustomSnackBar(response.body["message"]!, isError: false); 
      messageSendLoading.value = false; 
    messageController.value.clear(); // Clear the message text field
    customImageAddSendController.images.clear(); // Clear the image list
    customImageAddSendController.images.refresh(); // Refresh the observable image list
      // messageSendLoading.value = false;
      // messageController.value.clear(); 
      // customImageAddSendController.images.clear(); 
      // customImageAddSendController.images.refresh();
      refresh();
      getMessage();
    }
  }

  ///================= Start Conversation  ===============
  RxBool conversationSendLoading = false.obs;
  Future<void> startConversation() async {
    conversationSendLoading.value = true;
    final userId = await SharePrefsHelper.getString(AppConstants.userId);
    refresh();
    var body = {
      "user": {
        "name": profileController.profileModel.value.fullName,
        "userId": userId,
      }
    };
    var response =
        await ApiClient.postData(ApiUrl.postConversation, jsonEncode(body));
    if (response.statusCode == 200) {
      SharePrefsHelper.setString(AppConstants.conversationId, response.body["data"]['_id']);

      final conver = await SharePrefsHelper.getString(AppConstants.conversationId);

      debugPrint('======================conversationId: $conver');

      Get.toNamed(AppRoutes.messageScreen);
      conversationSendLoading.value = false;
      refresh();
      showCustomSnackBar(response.body["message"]!, isError: false);
      getMessage();
    } else {
      conversationSendLoading.value = false;
      refresh();
      ApiChecker.checkApi(response);
    }
  }

  ///============================ Get Image Seleted =========================
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

  @override
  void onInit() {
    getMessage();
    // TO DO: implement onInit
    super.onInit();
  }
}
