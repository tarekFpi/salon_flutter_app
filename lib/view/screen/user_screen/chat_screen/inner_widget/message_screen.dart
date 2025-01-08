// ignore_for_file: prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/helper/shared_prefe/shared_prefe.dart';
import 'package:salon_booking_app/helper/time_converter/time_converter.dart';
import 'package:salon_booking_app/service/api_url.dart';
import 'package:salon_booking_app/view/components/custom_image_add_send/custom_image_add_send.dart';
import 'package:salon_booking_app/view/components/custom_image_add_send/custom_image_add_send_controller.dart';
import 'package:salon_booking_app/view/components/custom_loader/custom_loader.dart';
import 'package:salon_booking_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:salon_booking_app/view/components/general_error.dart';
import 'package:salon_booking_app/view/screen/user_screen/chat_screen/chat_controller/chat_controller.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_const/app_const.dart';
import '../../../../components/custom_text/custom_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final ChatController chatController = Get.find<ChatController>();
  final CustomImageAddSendController customImageAddSendController =
      Get.find<CustomImageAddSendController>();

  final List<bool> align = [
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    false
  ];

  String? userId;

  @override
  void initState() {
    getUserId();
    chatController.getMessage();
    super.initState();
  }

  getUserId() async {
    userId = await SharePrefsHelper.getString(AppConstants.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        surfaceTintColor: AppColors.white,
        elevation: 5,
        shadowColor: AppColors.white,
        centerTitle: false,
        backgroundColor: AppColors.white,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
              ),
              onPressed: () => Get.toNamed(AppRoutes.userHomePage),
            ),
          ],
        ),
        title: Row(
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  imageUrl: AppConstants.admin,
                  height: 54.w,
                  width: 54.w,
                  boxShape: BoxShape.circle,
                ),
                Positioned(
                  bottom: 5.w,
                  right: 0,
                  child: Container(
                    height: 12.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                        color: AppColors.greenColor, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  text: "Admin",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black_50),
              CustomText(
                text: "Active Now",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                // ignore: deprecated_member_use
                color: AppColors.black_50.withOpacity(0.5),
              ),
            ]),
          ],
        ),
      ),
      body: Obx(
        () {
          switch (chatController.messageStatusLoading.value) {
            case Status.loading:
              return Center(child: CustomLoader());
            case Status.internetError:
              return Center(
                  child: GeneralErrorScreen(
                      onTap: () => chatController.getMessage()));
            case Status.error:
              return GeneralErrorScreen(
                  onTap: () => chatController.getMessage());
            case Status.completed:
              return Column(
                children: [
                  //============================= Measage Screen =============================
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: ListView(
                        //addAutomaticKeepAlives: true,
                        dragStartBehavior: DragStartBehavior.down,
                        reverse: true,
                        shrinkWrap: true,
                        children: List.generate(
                            chatController.messageList.length, (index) {
                          final data = chatController.messageList[index];
                          return CustomInboxMassage(
                            alignment: data.senderRole == 'user' ? false : true,
                            message: data.content ?? '',
                            messageTime: DateConverter.formatServerTime(
                              data.createdAt ?? "",
                            ),
                            type: data.type ?? '',
                            imageUrls: data.attachment ?? [],
                          );
                        }),
                      ),
                    ),
                  ),
                  //========================= Write Message Screen ==========================
                  ///================= image seledted and send ===========
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 20,
                      bottom: 20,
                    ),
                    child: CustomImageAddSend(
                      //===== text field Controller ====
                      textEditingController:
                          chatController.messageController.value,
                      // textEditingController: customImageAddSendController.messageController,
                      fillColor: AppColors.white,
                      textColor: AppColors.black_50,
                      imageIconColor: AppColors.black_50,
                      //====== image button Controller ==
                      imageOnTapButton: () {
                        customImageAddSendController.pickImage();
                        // setState(() {

                        // });
                      }, //ustomImageAddSendController.pickImage,
                      //====== send button Controller ==
                      sendOnTapButton: () {
                        if (chatController
                                .messageController.value.text.isNotEmpty ||
                            customImageAddSendController.images.isNotEmpty) {
                          chatController.sendMessage(
                            message:
                                chatController.messageController.value.text,
                          );
                        }
                        //customImageAddSendController.sendMessage();
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       right: 20.0, left: 20, bottom: 20),
                  //   child: Row(
                  //     children: const [],
                  //   ),
                  // )
                ],
              );
          }
        },
      ),
    );
  }
}

class CustomInboxMassage extends StatelessWidget {
  const CustomInboxMassage({
    super.key,
    required this.alignment,
    required this.message,
    this.messageTime,
    required this.type,
    required this.imageUrls,
  });
  final bool alignment;
  final String message;
  final String? messageTime;
  final String type;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment:
            alignment ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          alignment
              ? Row(
                  children: [
                    CustomNetworkImage(
                      imageUrl: AppConstants.admin,
                      height: 45.w,
                      width: 45.w,
                      boxShape: BoxShape.circle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        type == 'text'
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                alignment: alignment
                                    ? Alignment.topLeft
                                    : Alignment.topRight,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: alignment
                                          ? AppColors.white
                                          : AppColors.primary,
                                      borderRadius: alignment
                                          ? const BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            )
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomLeft: Radius.circular(16),
                                            ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 10),
                                      child: CustomText(
                                        textAlign: alignment
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        text: message,
                                        fontSize: 16.sp,
                                        color: alignment
                                            ? AppColors.black_50
                                            : AppColors.white,
                                        fontWeight: FontWeight.w400,
                                        maxLines: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : buildImageSection(imageUrls, context, message),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: CustomText(
                            text: messageTime ?? '',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_50,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : type == 'text'
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      alignment:
                          alignment ? Alignment.topLeft : Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color:
                                alignment ? AppColors.white : AppColors.primary,
                            borderRadius: alignment
                                ? const BorderRadius.only(
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 10),
                            child: CustomText(
                              textAlign:
                                  alignment ? TextAlign.right : TextAlign.left,
                              text: message,
                              fontSize: 16.sp,
                              color: alignment
                                  ? AppColors.black_50
                                  : AppColors.white,
                              fontWeight: FontWeight.w400,
                              maxLines: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  : buildImageSection(imageUrls, context, message),
          SizedBox(
            height: 4.h,
          ),
          alignment
              ? Container()
              : CustomText(
                  text: messageTime ?? '',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black_50,
                ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  buildImageSection(
      List<String> imageUrls, BuildContext context, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
            children: List.generate(imageUrls.length, (index) {
          return Column(
            children: [
              CustomNetworkImage(
                imageUrl: ApiUrl.imageUrl + imageUrls[index],
                height: 200.h,
                width: 200.w,
                borderRadius: BorderRadius.circular(20),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          );
        })),
        if (content != null && content.isNotEmpty)
          Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                alignment: alignment ? Alignment.topLeft : Alignment.topRight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: alignment ? AppColors.white : AppColors.primary,
                      borderRadius: alignment
                          ? const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 10),
                      child: CustomText(
                        textAlign: alignment ? TextAlign.right : TextAlign.left,
                        text: message,
                        fontSize: 16.sp,
                        color: alignment ? AppColors.black_50 : AppColors.white,
                        fontWeight: FontWeight.w400,
                        maxLines: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        // SizedBox(
        //   height: 10.h,
        // ),
      ],
    );
  }
}
