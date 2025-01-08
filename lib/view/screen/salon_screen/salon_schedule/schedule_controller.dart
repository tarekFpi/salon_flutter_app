
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/service/api_check.dart';
import 'package:salon_booking_app/service/api_client.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/utils/ToastMsg/toast_message.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/day_slot_create_model/DaySlotCreateModel.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/model/ScheduleDayResponseModel.dart';


class ScheduleController  extends GetxController {


  RxList<DaySlotCreateModel> scheduleListDay = <DaySlotCreateModel>[].obs;

  RxList<String> createScheduleListTimeSlot = <String>[].obs;


  RxBool sunday = false.obs;
  RxBool monday = false.obs;
  RxBool tuesday = false.obs;
  RxBool wednesday = false.obs;
  RxBool thursday = false.obs;
  RxBool friday = false.obs;
  RxBool saturday = false.obs;

  RxString timeOpenPicker="Select Time".obs;

  RxString timeClosePicker ="Select Time".obs;

  final DateFormat openTimeFormat = DateFormat("hh:mm a");

  final DateFormat closeTimeFormat = DateFormat("hh:mm a");

  RxBool checkOpenStatues = false.obs;

  RxString createTimeSchedulePicker="Select Time".obs;

  final DateFormat timeShcheduleFormat = DateFormat("hh:mm a");

 // RxBool closeStatues =  true.obs;

  ///======================================>> get schedule open time <<================================
  ///
  Future<void> selectOpenTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final DateTime now = DateTime.now();
      final DateTime formattedTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

        timeOpenPicker.value = openTimeFormat.format(formattedTime);
    }
  }


  ///======================================>> get schedule close time <<================================
  Future<void> selectCloseTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final DateTime now = DateTime.now();
      final DateTime formattedTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      timeClosePicker.value = closeTimeFormat.format(formattedTime);
    }
  }


  ///======================================>> create Time schedule   <<================================
  Future<void> selectCreateTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final DateTime now = DateTime.now();
      final DateTime formattedTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      createTimeSchedulePicker.value = timeShcheduleFormat.format(formattedTime);

    }
  }




  ///======================================>> Retrive ScheduleBy DaySlot api <<================================

  ///RxList<ScheduleDayResponseModel> scheduleDaySlotList = <ScheduleDayResponseModel>[].obs;

  Rx<ScheduleDayResponseModel> scheduleDaySlotList = ScheduleDayResponseModel().obs;

  Future<void> scheduleByDay() async{

    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

    var response = await ApiClient.getData(ApiUrl.scheduleByDay(outletId: outletId));

    if (response.statusCode == 201) {

    ///scheduleDaySlotList.value = List.from(response.body["data"].map((m)=> ScheduleDayResponseModel.fromJson(m)));

      scheduleDaySlotList.value =ScheduleDayResponseModel.fromJson(response.body["data"]);

      debugPrint("scheduleList:${scheduleDaySlotList.toJson()}");

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





  ///======================================>> create  ScheduleBy Day time Slot api  <<================================

  Rx<TextEditingController> capacityNumberController = TextEditingController().obs;

  RxBool createScheduleDayLoading = false.obs;

  Future<void> createScheduleByDay() async{


    var outletId = await SharePrefsHelper.getString(AppConstants.userId);

          createScheduleDayLoading.value=true;

         EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.custom);

            var body = jsonEncode({
              "outlet":outletId,
              "daySlot":scheduleListDay,
             /// "timeSlot":createScheduleListTimeSlot,
              "timeSlot":scheduleDaySlotList.value.timeSlot,
              "capacityOnTime": capacityNumberController.value.text
            });

            var response = await ApiClient.postData(ApiUrl.createDaySlots,body);

            if (response.statusCode == 200) {

              Fluttertoast.showToast(
                  msg: "Schedule modification successfully",
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

              debugPrint("scheduleListBody:${body}");

              scheduleByDay();

                createScheduleDayLoading.value = false;

                timeOpenPicker.value="Select Time";

                timeClosePicker.value="Select Time";

              capacityNumberController.value.clear();

              scheduleListDay.value.clear();
              createScheduleListTimeSlot.clear();

              refresh();

              EasyLoading.dismiss();

            } else {

              EasyLoading.dismiss();
              createScheduleDayLoading.value=false;
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