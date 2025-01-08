
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_icons/app_icons.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_image/custom_image.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/day_slot_create_model/DaySlotCreateModel.dart';
import 'package:salon_booking_app/view/screen/salon_screen/salon_schedule/schedule_controller.dart';

class SalonTimeScheduleScreen extends StatefulWidget {
  const SalonTimeScheduleScreen({super.key});

  @override
  State<SalonTimeScheduleScreen> createState() =>
      _SalonTimeScheduleScreenState();
}

class _SalonTimeScheduleScreenState extends State<SalonTimeScheduleScreen> {

  final schedulController = Get.put(ScheduleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    schedulController.scheduleByDay();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(appBarContent: AppStrings.schedule),
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: SingleChildScrollView(
          child:Obx(
              () {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 24.w,
                    ),

                    ///================== Salon Time Schedule ===================//

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImage(imageSrc: AppIcons.calder),
                        const SizedBox(
                          width: 6,
                        ),
                        const CustomText(
                          text: "Create Day Schedule",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                          bottom: 8,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: (){

                                  ///================== Set time schedule Alertdialog ===================//

                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        backgroundColor:  Colors.white,
                                        insetPadding: EdgeInsets.all(8),
                                        contentPadding: EdgeInsets.all(8),
                                        //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                        title:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            const CustomText(
                                              text: "Create Day schedule",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                              bottom: 8,
                                            ),

                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();

                                                    schedulController.scheduleListDay.clear();
                                                    schedulController.sunday.value=false;
                                                    schedulController.monday.value=false;
                                                    schedulController.tuesday.value=false;
                                                    schedulController.wednesday.value=false;
                                                    schedulController.friday.value=false;
                                                    schedulController.saturday.value=false;
                                                    schedulController.checkOpenStatues.value=false;
                                                    schedulController.timeOpenPicker.value="Select Time";
                                                    schedulController.timeClosePicker.value="Select Time";

                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    size: 32,
                                                    color: Colors.black,
                                                  )),
                                            )
                                          ],
                                        ),
                                        content: SizedBox(
                                          width: MediaQuery.of(context).size.width ,
                                          height: MediaQuery.of(context).size.height,
                                          //child: SalonTimeScheduleAlert(),
                                          child: Obx(
                                            ()=> SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        Column(
                                                          children: [
                                                            const CustomText(
                                                              text: "Open time",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.black_50,
                                                              bottom: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                schedulController.selectOpenTime();

                                                              },
                                                              child: Container(
                                                                height: 100,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Colors.white,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Colors.grey,
                                                                      blurRadius: 1.0,
                                                                      spreadRadius: 0.0,
                                                                      offset:
                                                                      Offset(0, 1), // shadow direction: bottom right
                                                                    )
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [

                                                                    Icon(Icons.keyboard_arrow_up_outlined),

                                                                      CustomText(
                                                                      text: schedulController.timeOpenPicker.value,
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColors.black_50,
                                                                    ),

                                                                    Icon(Icons.keyboard_arrow_down),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),

                                                        Column(
                                                          children: [
                                                            const CustomText(
                                                              text: "Closed time",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.black_50,
                                                              bottom: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                schedulController.selectCloseTime();
                                                              },
                                                              child: Container(
                                                                height: 100,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Colors.white,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Colors.grey,
                                                                      blurRadius: 1.0,
                                                                      spreadRadius: 0.0,
                                                                      offset:
                                                                      Offset(0, 1), // shadow direction: bottom right
                                                                    )
                                                                  ],
                                                                ),
                                                                child:  Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [

                                                                    Column(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        Icon(Icons.keyboard_arrow_up_outlined),
                                                                        CustomText(
                                                                          text:  schedulController.timeClosePicker.value,
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: AppColors.black_50,
                                                                        ),
                                                                        Icon(Icons.keyboard_arrow_down),
                                                                      ],
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    const Divider(
                                                      height: 8,
                                                      color: Colors.black,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            CustomText(
                                                              text: "Closed:",
                                                              fontSize: 16,
                                                              color: AppColors.primary,
                                                              fontWeight: FontWeight.w700,
                                                            ),

                                                            Radio<bool>(
                                                              value: false, // Value for "No"
                                                              fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                                              groupValue: schedulController.checkOpenStatues.value,
                                                              onChanged: (bool? value) {
                                                                schedulController.checkOpenStatues.value = value!;
                                                               // schedulController.closeStatues.value=false;
                                                              },
                                                            ),
                                                            CustomText(
                                                              text: "No",
                                                              fontSize: 14,
                                                              color: AppColors.bdColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),

                                                            Radio<bool>(
                                                              value: true, // Value for "Yes"
                                                              fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
                                                              groupValue: schedulController.checkOpenStatues.value,
                                                              onChanged: (bool? value) {
                                                                schedulController.checkOpenStatues.value = value!;
                                                               // schedulController.closeStatues.value=true;
                                                              },
                                                            ),
                                                            CustomText(
                                                              text: "Yes",
                                                              fontSize: 14,
                                                              color: AppColors.bdColor,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ],
                                                        ),


                                                      ],
                                                    ),

                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    const CustomText(
                                                      text: "Day selection",
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.primary,
                                                      bottom: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [

                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              const CustomText(
                                                                text: "Sunday",
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                color: AppColors.primary,
                                                              ),
                                                              Checkbox(
                                                                checkColor: AppColors.white,
                                                                activeColor: AppColors.primary,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(3.0),
                                                                ),
                                                                side: const BorderSide(
                                                                  // ======> CHANGE THE BORDER COLOR HERE <======
                                                                  color: Colors.pink,
                                                                  // Give your checkbox border a custom width
                                                                  width: 1.4,
                                                                ),
                                                                value: schedulController.sunday.value,
                                                                onChanged: (bool? value) {

                                                                  schedulController.sunday.value = value!;
                                                                  //schedul]eListDay

                                                                  DaySlotCreateModel sundaySlot = DaySlotCreateModel(
                                                                    dayName: "Sunday",
                                                                    dayIndex: 0,
                                                                    openTime: schedulController.timeOpenPicker.toString(),
                                                                    closeTime: schedulController.timeClosePicker.toString(),
                                                                    isClosed: schedulController.checkOpenStatues.value,
                                                                  );

                                                                  if(schedulController.sunday.value){

                                                                    schedulController.scheduleListDay.add(sundaySlot);

                                                                  }else{

                                                                   /// schedulController.scheduleListDay.value.remove("Sunday");

                                                                    schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Sunday"));
                                                                  }

                                                                },
                                                              ),
                                                            ],
                                                          ),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Monday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value:schedulController.monday.value,
                                                              onChanged: (bool? value) {

                                                             schedulController.monday.value = value!;

                                                             DaySlotCreateModel mondaySlot = DaySlotCreateModel(
                                                               dayName: "Monday",
                                                               dayIndex: 1,
                                                               openTime: schedulController.timeOpenPicker.toString(),
                                                               closeTime: schedulController.timeClosePicker.toString(),
                                                               isClosed: schedulController.checkOpenStatues.value,
                                                             );

                                                             if(schedulController.monday.value){

                                                               schedulController.scheduleListDay.add(mondaySlot);

                                                             }else{

                                                             ///  schedulController.scheduleListDay.value.remove(mondaySlot);

                                                               schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Monday"));
                                                             }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Tuesday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value: schedulController.tuesday.value,
                                                              onChanged: (bool? value) {
                                                               schedulController.tuesday.value = value!;

                                                               DaySlotCreateModel tuesdaySlot = DaySlotCreateModel(
                                                                 dayName: "Tuesday",
                                                                 dayIndex: 2,
                                                                 openTime: schedulController.timeOpenPicker.toString(),
                                                                 closeTime: schedulController.timeClosePicker.toString(),
                                                                 isClosed: schedulController.checkOpenStatues.value,
                                                               );

                                                               if(schedulController.tuesday.value){

                                                                 schedulController.scheduleListDay.add(tuesdaySlot);

                                                               }else{

                                                               ///schedulController.scheduleListDay.value.remove(tuesdaySlot);

                                                                 schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Tuesday"));
                                                               }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Wednesday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value: schedulController.wednesday.value,
                                                              onChanged: (bool? value) {
                                                                  schedulController.wednesday.value = value!;

                                                                  DaySlotCreateModel wednesdaySlot = DaySlotCreateModel(
                                                                    dayName: "Wednesday",
                                                                    dayIndex: 3,
                                                                    openTime: schedulController.timeOpenPicker.toString(),
                                                                    closeTime: schedulController.timeClosePicker.toString(),
                                                                    isClosed: schedulController.checkOpenStatues.value,
                                                                  );

                                                                  if(schedulController.wednesday.value){

                                                                    schedulController.scheduleListDay.add(wednesdaySlot);

                                                                  }else{

                                                                    ///schedulController.scheduleListDay.remove("Wednesday");

                                                                    schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Wednesday"));
                                                                  }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Thursday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value: schedulController.thursday.value,
                                                              onChanged: (bool? value) {
                                                                  schedulController.thursday.value = value!;

                                                                  DaySlotCreateModel thursdaySlot = DaySlotCreateModel(
                                                                    dayName: "Thursday",
                                                                    dayIndex: 4,
                                                                    openTime: schedulController.timeOpenPicker.toString(),
                                                                    closeTime: schedulController.timeClosePicker.toString(),
                                                                    isClosed: schedulController.checkOpenStatues.value,
                                                                  );

                                                                  if(schedulController.thursday.value){

                                                                    schedulController.scheduleListDay.add(thursdaySlot);

                                                                  }else{

                                                                    schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Thursday"));
                                                                  }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Friday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value: schedulController.friday.value,
                                                              onChanged: (bool? value) {
                                                                  schedulController.friday.value = value!;

                                                                  DaySlotCreateModel fridaySlot = DaySlotCreateModel(
                                                                    dayName: "Friday",
                                                                    dayIndex: 5,
                                                                    openTime: schedulController.timeOpenPicker.toString(),
                                                                    closeTime: schedulController.timeClosePicker.toString(),
                                                                    isClosed: schedulController.checkOpenStatues.value,
                                                                  );

                                                                  if(schedulController.friday.value){

                                                                    schedulController.scheduleListDay.add(fridaySlot);

                                                                  }else{

                                                                    schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Friday"));
                                                                  }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const CustomText(
                                                              text: "Saturday",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: AppColors.primary,
                                                            ),
                                                            Checkbox(
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.primary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(3.0),
                                                              ),
                                                              side: const BorderSide(
                                                                // ======> CHANGE THE BORDER COLOR HERE <======
                                                                color: Colors.pink,
                                                                // Give your checkbox border a custom width
                                                                width: 1.4,
                                                              ),
                                                              value: schedulController.saturday.value,
                                                              onChanged: (bool? value) {

                                                                schedulController.saturday.value = value!;

                                                                DaySlotCreateModel saturdaySlot = DaySlotCreateModel(
                                                                  dayName: "Saturday",
                                                                  dayIndex: 6,
                                                                  openTime: schedulController.timeOpenPicker.toString(),
                                                                  closeTime: schedulController.timeClosePicker.toString(),
                                                                  isClosed: schedulController.checkOpenStatues.value,
                                                                );

                                                                if(schedulController.saturday.value){

                                                                  schedulController.scheduleListDay.add(saturdaySlot);

                                                                }else{

                                                                  schedulController.scheduleListDay.value.removeWhere(((item)=>item.dayName == "Saturday"));
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),

                                                    const SizedBox(
                                                      height: 4,
                                                    ),

                                                    ///================== select Schedule by Day ===================
                                                    CustomButton(
                                                      onTap: () {

                                                       //String jsonString = jsonEncode(schedulController.scheduleListDay);
                                                      //  debugPrint("scheduleListDay:${jsonString}");


                                                        if(schedulController.scheduleListDay.isEmpty){

                                                          Fluttertoast.showToast(
                                                              msg: "Please Schedule Day Empty??..",
                                                              toastLength: Toast.LENGTH_LONG,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0
                                                          );

                                                        }else if(schedulController.timeOpenPicker.value=="Select Time"){

                                                          Fluttertoast.showToast(
                                                              msg: "Please Open Time Empty??..",
                                                              toastLength: Toast.LENGTH_LONG,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0
                                                          );

                                                        }else if(schedulController.timeClosePicker.value=="Select Time"){

                                                          Fluttertoast.showToast(
                                                              msg: "Please Close Time Empty??..",
                                                              toastLength: Toast.LENGTH_LONG,
                                                              backgroundColor: Colors.red,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0
                                                          );

                                                        }else{

                                                            Navigator.of(context).pop();

                                                        }
                                                      },
                                                      title: "Selected",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));

                                },
                                child: CustomImage(imageSrc: AppIcons.schedule_icon2)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 12.w,
                    ),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        CustomText(
                          text: DateConverter.formattedDate(),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black_50,
                          bottom: 8,
                        ),

                        const SizedBox(
                          width: 8,
                        ),
                        CustomImage(imageSrc: AppIcons.schedule_icon3),
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    /*  return const CustomScheduleDay(
                              dayName: "Monday", time: "9:00am - 6:00pm"); */

                    ///================== Salon Salon Time Schedule ===================//

                    Column(children: List.generate(schedulController.scheduleDaySlotList.value.daySlot?.length??0, (index) {


                            final model = schedulController.scheduleDaySlotList.value.daySlot?[index];

                        ///======== (isClosed) then salon off condition =========================================

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15, left: 4, right: 4),
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Container(
                                          height: 30.h,
                                          width: 6.w,
                                          color: AppColors.greenColor,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        CustomText(
                                          text: "${model?.dayName}",
                                          fontSize: 14.sp,
                                          color: AppColors.black_50,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),

                                     Center(
                                       child: CustomText(
                                        text: model?.isClosed==true? "Closed":"${model?.openTime} - ${model?.closeTime}",
                                        fontSize: 14.sp,
                                        color: AppColors.black_50,
                                        fontWeight: FontWeight.w500,
                                         ),
                                     ),

                                  ],
                                ),
                              ),
                            );
                          })),


                    const SizedBox(
                      height: 12,
                    ),

                    ///================== Salon Booking time Schedule ===================//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomImage(imageSrc: AppIcons.calder),
                        const SizedBox(
                          width: 6,
                        ),
                        const CustomText(
                          text: "Salon Time Schedule",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                          bottom: 8,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {
                                  ///================== Set time schedule Alertdialog ===================//

                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      backgroundColor:  Colors.white,
                                      insetPadding: EdgeInsets.all(8),
                                      contentPadding: EdgeInsets.all(8),
                                      //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                      title:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          const CustomText(
                                            text: "Create Time Schedule",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary,
                                            bottom: 8,
                                          ),

                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                                onTap: () {

                                                  Navigator.of(context).pop();

                                                  schedulController.createScheduleListTimeSlot.clear();
                                                  schedulController.createTimeSchedulePicker.value="Select Time";

                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 32,
                                                  color: Colors.black,
                                                )),
                                          )
                                        ],
                                      ),
                                      content: SizedBox(
                                        width: MediaQuery.of(context).size.width ,
                                        height: MediaQuery.of(context).size.height *.3,
                                        child:Obx(
                                          ()=> SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [

                                                Column(
                                                  children: [
                                                    const CustomText(
                                                      text: "Select time",
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.black_50,
                                                      bottom: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){

                                                        schedulController.selectCreateTime();

                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 180,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors.grey,
                                                              blurRadius: 1.0,
                                                              spreadRadius: 0.0,
                                                              offset:
                                                              Offset(0, 1), // shadow direction: bottom right
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [

                                                            Icon(Icons.keyboard_arrow_up_outlined),

                                                            CustomText(
                                                              text: schedulController.createTimeSchedulePicker.value,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                              color: AppColors.black_50,
                                                            ),

                                                            Icon(Icons.keyboard_arrow_down),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: 16.h,
                                                ),

                                                ///================== Select time button ===================
                                                CustomButton(
                                                  onTap: () {

                                                   if(schedulController.createTimeSchedulePicker.value=="Select Time"){

                                                      Fluttertoast.showToast(
                                                          msg: "Please Create Schedule Time Empty??..",
                                                          toastLength: Toast.LENGTH_LONG,
                                                          backgroundColor: Colors.red,
                                                          textColor: Colors.white,
                                                          fontSize: 16.0
                                                      );

                                                    }else if(schedulController.scheduleDaySlotList.value.timeSlot!.contains(schedulController.createTimeSchedulePicker.value)){

                                                     Fluttertoast.showToast(
                                                         msg: "Time Schedule already exists!!",
                                                         toastLength: Toast.LENGTH_LONG,
                                                         backgroundColor: Colors.red,
                                                         textColor: Colors.white,
                                                         fontSize: 16.0
                                                     );
                                                    }else{


                                                 /// schedulController.createScheduleListTimeSlot.add(schedulController.createTimeSchedulePicker.value);
                                                  /// schedulController.createTimeSchedulePicker.value="Select Time";

                                                     schedulController.scheduleDaySlotList.value.timeSlot?.add(schedulController.createTimeSchedulePicker.value);


                                                      Navigator.of(context).pop();
                                                    }
                                                  },
                                                  title: "Selected Time",
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    ),
                                  );

                                },
                                child: const CustomImage(
                                    imageSrc: AppIcons.schedule_icon2)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),

              ///================== Salon Booking time Schedule ===================//
                    if(schedulController.scheduleDaySlotList.value.timeSlot!=null)
                    GridView.count(
                        childAspectRatio: 4 / 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 24.0,
                         children: [

                           for(int i = 0; i <schedulController.scheduleDaySlotList.value.timeSlot!.length; i++)
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8.0),
                                 color: Colors.white,
                                 boxShadow: const [
                                   BoxShadow(
                                     color: Colors.grey,
                                     blurRadius: 1.0,
                                     spreadRadius: 0.0,
                                     offset:
                                     Offset(0, 1), // shadow direction: bottom right
                                   )
                                 ],
                               ),
                               child:  Center(
                                 child: CustomText(
                                   text: "${schedulController.scheduleDaySlotList.value.timeSlot?[i]}",
                                   fontSize: 12,
                                   fontWeight: FontWeight.w500,
                                   color: AppColors.black_50,
                                 ),
                               ),
                             )
                         ],
                      ),


                    const SizedBox(
                      height: 16,
                    ),

                    ///================== capacity at one time ===================//
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImage(
                            imageSrc: AppIcons.schedule_icon4),
                        SizedBox(
                          width: 8,
                        ),
                      CustomText(
                          text: AppStrings.capacityvalue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),

                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: schedulController.capacityNumberController.value,
                      decoration: InputDecoration(
                        //label:   Text(AppStrings.capacityvalue),
                        hintText:  AppStrings.capacityInput,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                    ),


                      const SizedBox(
                      height: 22,
                    ),


   ///=========================================== Confirm summation api call ========================================================
                    CustomButton(
                      onTap: () {


               ///   debugPrint("timeSchedule:${jsonEncode(schedulController.scheduleDaySlotList.value.timeSlot)}");

                       if(schedulController.scheduleListDay.isEmpty){

                          Fluttertoast.showToast(
                              msg: "Please Schedule Day Empty??..",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }else if(schedulController.timeOpenPicker.value=="Select Time"){

                          Fluttertoast.showToast(
                              msg: "Please Day Schedule Open Time Empty??..",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }else if(schedulController.timeClosePicker.value=="Select Time"){

                          Fluttertoast.showToast(
                              msg: "Please Day Schedule Close Time Empty??..",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }else if(schedulController.scheduleDaySlotList.value.timeSlot!.isEmpty){

                          Fluttertoast.showToast(
                              msg: "Please Create Time Schedule Empty??..",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }else if(schedulController.capacityNumberController.value.text==""){

                          Fluttertoast.showToast(
                              msg: "Please Capacity Number is Empty??..",
                              toastLength: Toast.LENGTH_LONG,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }else{


                         schedulController.createScheduleByDay();

                       ///debugPrint("scheduleListDay:${jsonEncode(schedulController.scheduleListDay)}");
                        }
                      },
                      title: "Save",
                    ),
                  ]);
            }
          ),
        ),
      )
    );
  }
}

