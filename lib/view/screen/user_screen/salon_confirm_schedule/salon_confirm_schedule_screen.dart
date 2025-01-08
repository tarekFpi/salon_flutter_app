// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/utils/app_strings/app_strings.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/custom_text/custom_text.dart';
import 'package:salon_booking_app/view/screen/user_screen/salon_confirm_schedule/controller/salon_confirm_schedule_controller.dart';
import 'package:salon_booking_app/view/screen/user_screen/user_home/user_home_page/user_home_controller/user_home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class SalonConfirmScheduleScreen extends StatefulWidget {
  const SalonConfirmScheduleScreen({super.key});

  @override
  State<SalonConfirmScheduleScreen> createState() =>
      _RequestAppointmentScreenState();
}

class _RequestAppointmentScreenState extends State<SalonConfirmScheduleScreen> {
  final UserHomeController homeController = Get.find<UserHomeController>();
  final SalonConfirmSchedule scheduleController =
      Get.find<SalonConfirmSchedule>();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      today = selectedDay;
      scheduleController.getWeekDayName(selectedDay);
    });
  }

  // @override
  // void initState() {
  //    // scheduleController.getWeekDayName(today);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarContent: AppStrings.confirmSchedule,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() {
            return Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Select Date",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      bottom: 10.h,
                      color: AppColors.primary,
                    )),
                TableCalendar(
                  calendarStyle: CalendarStyle(
                    // Default day color
                    defaultTextStyle: TextStyle(color: AppColors.primary),
                    // Highlight today's date
                    todayDecoration: BoxDecoration(
                      color: AppColors.red, // Replace with your color
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.white, // Text color inside today circle
                    ),
                    // Highlight selected day
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue, // Replace with your color
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white, // Text color inside selected circle
                    ),
                    // Color for days outside the current month
                    outsideTextStyle: TextStyle(color: Colors.white),
                  ),
                  locale: "en_US",
                  rowHeight: 43,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  onDaySelected: _onDaySelected,
                  selectedDayPredicate: (selectedDay) =>
                      isSameDay(selectedDay, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 10, 16),
                ),
                SizedBox(
                  height: 20.h,
                ),
                scheduleController.isOpen.value &&
                        homeController.sheduleResponse.value.timeSlot != null
                    ? Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Chose Time",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                bottom: 30.h,
                                color: AppColors.primary,
                              )),
                          //=================================== Grid View ================================//
                          GridView.count(
                            childAspectRatio: 4 / 1,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 24.0,
                            children: List.generate(
                                homeController.sheduleResponse.value.timeSlot
                                        ?.length ??
                                    0, (index) {
                              final data = homeController
                                      .sheduleResponse.value.timeSlot?[index] ??
                                  '';
                              debugPrint(
                                  '================Data=====================$data');
                              debugPrint(
                                  '================time Slot=====================${scheduleController.timeSlot.value}');
                              return GestureDetector(
                                onTap: () {
                                  scheduleController.timeSlot.value = data;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: scheduleController.timeSlot.value ==
                                            data
                                        ? AppColors.primary
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(
                                          0,
                                          1,
                                        ), // shadow direction: bottom right
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: data,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black_50,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text:
                                "Please send a request and Book your Schedule!",
                            fontSize: 10.w,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black_50,
                            bottom: 10.h,
                          ),
                          CustomButton(
                            onTap: () { 

                         

                            },
                            title: "Book Your Schedule",
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      )
                    : CustomText(
                        text: "Sorry, We are closed",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_50,
                        bottom: 10.h,
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
