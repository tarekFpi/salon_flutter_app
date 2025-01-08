
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_service/model/ServiceShowResponseModel.dart';

class ServiceSalonController  extends GetxController {



    RxList<String> items = [
    "Discount Type",
    "percentage",
    "fixed",
  ].obs;

  RxString selectedValue="Discount Type".obs;

  ///======================================>> picker Cover photo  <<================================
  final ImagePicker pickerCover = ImagePicker();
  //File? imagePath;
  RxString serviceImage = "".obs;

  Future<void> getpickImage() async {
    try {
      final XFile? pickedFile =
      await pickerCover.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Convert XFile to File if needed

        serviceImage.value = pickedFile.path; // Ensure the file path is valid

        serviceImagePathController.value.text = pickedFile.path;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  ///======================================>> Retrive service manager api <<================================

 RxList<ServiceShowResponseModel> servieceList = <ServiceShowResponseModel>[].obs;


  Future<void> serviceShow() async{


    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.serviceRetriveById(outletId: outletId));

    if (response.statusCode == 200) {

      servieceList.value = List.from(response.body["data"].map((m)=> ServiceShowResponseModel.fromJson(m)));


      debugPrint("servieceList:${servieceList.toJson()}");

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


    ///======================================>> Retrive service Create api <<================================

   Rx<TextEditingController> serviceNameController = TextEditingController().obs;

   Rx<TextEditingController> servicePriceController = TextEditingController().obs;

   Rx<TextEditingController> serviceDiscountController = TextEditingController().obs;

   Rx<TextEditingController> serviceImagePathController = TextEditingController().obs;

  RxBool isDiscount = false.obs;

    RxBool isHomeServiceAvailable = false.obs;

    RxBool createServiceLoading = false.obs;

  Future<void> createService() async{

    createServiceLoading.value =true;

    EasyLoading.show(dismissOnTap: true, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var outletName = await SharePrefsHelper.getString(AppConstants.outletName);

    var outletType = await SharePrefsHelper.getString(AppConstants.outletType);


    Map<String, String> body;

    if(selectedValue.value=="Discount Type"){

      body = {
        "name": serviceNameController.value.text,
        "outletId": outletId,
        "outletName": outletName,
        "outletType": outletType,
        "priceAmount": servicePriceController.value.text,
        "priceCurrency": "USD",
        "isDiscount": isDiscount.value.toString(), // Convert bool to String
        "discountAmount": serviceDiscountController.value.text,
        "discountCurrency": "USD",
        "isHomeServiceAvailable": isHomeServiceAvailable.value.toString(), // Convert bool to String
      };

    }else{

      body = {
        "name": serviceNameController.value.text,
        "outletId": outletId,
        "outletName": outletName,
        "outletType": outletType,
        "priceAmount": servicePriceController.value.text,
        "priceCurrency": "USD",
        "isDiscount": isDiscount.value.toString(), // Convert bool to String
        "discountType": selectedValue.value,
        "discountAmount": serviceDiscountController.value.text,
        "discountCurrency": "USD",
        "isHomeServiceAvailable": isHomeServiceAvailable.value.toString(), // Convert bool to String
      };
    }


   var response = await ApiClient.postMultipartData(ApiUrl.serviceCreate, body,
        multipartBody: [MultipartBody("image", File(serviceImage.value))]);


    if (response.statusCode == 201) {

      Fluttertoast.showToast(
          msg: "Service created Successfully!",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      createServiceLoading.value=false;

      cleanTextController();

      serviceShow();

      debugPrint("response:$response");

      refresh();

      EasyLoading.dismiss();

    } else {

      EasyLoading.dismiss();
      createServiceLoading.value=false;

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


  ///======================================>> update Single ShowData api <<================================
  void updateSingleShowData(ServiceShowResponseModel item){

    serviceNameController.value.text = item.name.toString();

    servicePriceController.value.text = item.price!.amount.toString();
    isHomeServiceAvailable.value = item.isHomeServiceAvailable!;
  }

    ///======================================>> cleanTextController <<================================
    void cleanTextController(){

      servicePriceController.value.clear();
      serviceNameController.value.clear();
      serviceDiscountController.value.clear();
      serviceImagePathController.value.clear();
      serviceImage.value="";
    }


 ///======================================>> Retrive service update api <<================================
    RxBool updateServiceLoading = false.obs;

    Future<void> updateService(String serviceId) async{

      updateServiceLoading.value=true;

       EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

      var outletId = await SharePrefsHelper.getString(AppConstants.userId);

      var outletName = await SharePrefsHelper.getString(AppConstants.outletName);

      var outletType = await SharePrefsHelper.getString(AppConstants.outletType);

      Map<String, String> body;

      if(selectedValue.value=="Discount Type"){

        body = {
          "name": serviceNameController.value.text,
          "outletId": outletId,
          "outletName": outletName,
          "outletType": outletType,
          "priceAmount": servicePriceController.value.text,
          "priceCurrency": "USD",
          "isDiscount": isDiscount.value.toString(), // Convert bool to String
          "discountAmount": serviceDiscountController.value.text,
          "discountCurrency": "USD",
          "isHomeServiceAvailable": isHomeServiceAvailable.value.toString(), // Convert bool to String
        };

      }else{

        body = {
          "name": serviceNameController.value.text,
          "outletId": outletId,
          "outletName": outletName,
          "outletType": outletType,
          "priceAmount": servicePriceController.value.text,
          "priceCurrency": "USD",
          "isDiscount": isDiscount.value.toString(), // Convert bool to String
          "discountType": selectedValue.value,
          "discountAmount": serviceDiscountController.value.text,
          "discountCurrency": "USD",
          "isHomeServiceAvailable": isHomeServiceAvailable.value.toString(), // Convert bool to String
        };
      }



      var response = await ApiClient.patchMultipartData(ApiUrl.serviceUpdate(serviceId: serviceId), body,
          multipartBody: [MultipartBody("image", File(serviceImage.value))]);


      if (response.statusCode == 200) {

        Fluttertoast.showToast(
            msg: "Service update successfully!",
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );

        updateServiceLoading.value=false;

        cleanTextController();

        serviceShow();

        debugPrint("response:${response}");

        refresh();

        EasyLoading.dismiss();

      } else {

        EasyLoading.dismiss();
        updateServiceLoading.value=false;
        refresh();

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

    serviceShow();
  }

}