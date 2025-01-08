// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/utils/app_const/app_const.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_appbar_two.dart';
import 'package:salon_booking_app/view/components/custom_button/custom_button.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/chat_controller/chat_controller.dart';

class StartChatScreen extends StatefulWidget {
  const StartChatScreen({super.key});

  @override
  State<StartChatScreen> createState() => _StartChatScreenState();
}

class _StartChatScreenState extends State<StartChatScreen> {
  final ChatController chatController = Get.find<ChatController>();

  @override
  initState() {
    super.initState();
    chakeIsFirstTime();
  }

  chakeIsFirstTime() async {
    final convertionId =
        await SharePrefsHelper.getString(AppConstants.conversationId);

    // ignore: unnecessary_null_comparison
    if (convertionId.isNotEmpty && convertionId != null) {
      Get.offAllNamed(AppRoutes.messageScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarTwo(appBarContent: "Chat With Admin"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* CustomText(
                  text: "Chat With Admin",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black_50,
                  bottom: 60,
                ),*/
            CustomButton(
              onTap: () {
                chatController.startConversation();
                //Get.toNamed(AppRoutes.messageScreen);
              },
              title: "Start Conversation",
              height: 65,
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 3,
      ),
    );
  }
}
