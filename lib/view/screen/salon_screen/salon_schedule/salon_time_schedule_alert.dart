// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';

class SalonTimeScheduleAlert extends StatefulWidget {
  const SalonTimeScheduleAlert({super.key});

  @override
  State<SalonTimeScheduleAlert> createState() => _SalonTimeScheduleAlertState();
}

class _SalonTimeScheduleAlertState extends State<SalonTimeScheduleAlert> {

  bool sunday = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;



   String timeOpenPicker="";

    String timeClosePicker ="";

  final DateFormat openTimeFormat = DateFormat("hh:mm a");

  final DateFormat closeTimeFormat = DateFormat("hh:mm a");



  Future<void> selectOpenTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
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
      setState(() {
        timeOpenPicker = openTimeFormat.format(formattedTime);
      });
    }
  }


  Future<void> selectCloseTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
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
      setState(() {
        timeClosePicker = closeTimeFormat.format(formattedTime);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                         selectOpenTime();

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
                              text:  timeOpenPicker,
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
                      text: "Close time",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black_50,
                      bottom: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                         selectCloseTime();
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
                        child:   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.keyboard_arrow_up_outlined),
                                CustomText(
                                  text: timeClosePicker,
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
                      value: sunday,
                      onChanged: (bool? value) {
                        setState(() {
                          sunday = value!;
                        });
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
                      value: monday,
                      onChanged: (bool? value) {
                        setState(() {
                          monday = value!;
                        });
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
                      value: thursday,
                      onChanged: (bool? value) {
                        setState(() {
                          thursday = value!;
                        });
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
                      value: wednesday,
                      onChanged: (bool? value) {
                        setState(() {
                          wednesday = value!;
                        });
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
                      value: thursday,
                      onChanged: (bool? value) {
                        setState(() {
                          thursday = value!;
                        });
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
                      value: friday,
                      onChanged: (bool? value) {
                        setState(() {
                          friday = value!;
                        });
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
                      value: saturday,
                      onChanged: (bool? value) {
                        setState(() {
                          saturday = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 4,
            ),

            ///================== Confirm ===================
            CustomButton(
              onTap: () {},
              title: "Confirm",
            ),
          ],
        ),
      ),
    );
  }
}
